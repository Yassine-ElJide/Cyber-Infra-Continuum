# {{MACHINE_NAME}}

| | |
|---|---|
| **OS** | {{OS}} |
| **Difficulty** | Easy / Medium / Hard / Insane |
| **Date owned** | YYYY-MM-DD |
| **Retired** | - [ ] Confirmed RETIRED on HTB |

> ⚠️ **PUBLISH ONLY WHEN THE MACHINE IS RETIRED.** Do not commit this file to a public repo until the box has retired. No flags, passwords or hashes in the text.

## Summary

2–3 sentences: what the box is, the attack path in one line, and the core weakness.

## Enumeration

### Port scan

```bash
nmap -sC -sV -p- --min-rate 2000 -oN scans/nmap-full.txt <TARGET_IP>
```

### Services

| Port | Service | Version | Notes |
|---|---|---|---|
| | | | |

## Foothold / initial access

What I found, why it worked, and how I got a shell.

## Privilege escalation

Path from low-privileged user to root / SYSTEM, and the misconfiguration that allowed it.

## What this taught me about the system

How the box worked under the hood, and what a well-configured environment would have done differently.

- **How it worked:** services, misconfigurations, trust relationships involved
- **Well-configured instead:** the practical fix (least privilege, patching, segmentation, config baseline…)
- **Infra takeaway:** what I'd check on a real system

## Key takeaways / lessons learned

- 
- 

## Tools used

- 
