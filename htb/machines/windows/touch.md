# Touch

| | |
|---|---|
| **OS** | Windows |
| **Difficulty** | Easy |
| **Date owned** | 2026-10-24 |
| **Retired** | - [x] Confirmed RETIRED on HTB |

> ⚠️ This writeup covers a RETIRED machine only, in line with HTB's rules. No flags, passwords or hashes are published.

## Summary

Touch is an easy Windows box built around an airline self-check-in kiosk. The real difficulty isn't any single exploit, it's the **chain**: each step only opens the door to the next one, and nothing works if you skip a link. Booking lookup → device login → API tampering → kiosk breakout → shell → database creds → UDF privesc to SYSTEM.

## Skills demonstrated
- Web enumeration & API poking
- Reading hints in page source / HTML attributes
- Kiosk / GUI breakout techniques
- Abusing a backend API with no server-side authorization
- MySQL UDF privilege escalation

## The chain, step by step

### 1. Recon gives you a name and a code, not a password

Nmap turns up a device-management web app (Nexion DeviceHub) alongside RDP and a kiosk-style web port. An earlier machine in the same season (Layover) hands over a passenger name and a booking confirmation code. The trap here is assuming the code is a password straight away — it isn't. The login page only has a **password field**, so the name/code pair has to go somewhere else first.

### 2. Read the page, not just the form

The login page's HTML hints that the device's default password is its **serial number**. That serial is exposed through an unauthenticated status API on the device-management app. Pull the serial, log in as the device, not as a user.

### 3. Inside the device dashboard: pivot sideways

Once inside Nexion DeviceHub, there's a second set of credentials sitting in the dashboard for the kiosk machine itself (RDP access). The device admin panel is really just a stepping stone to the kiosk box, not the end goal.

### 4. Back on the booking site: the API trusts the client

The kiosk's self-check-in flow uses the name + booking code from step 1 to pull up a booking. Before going further, the passport **scanner device** needs to be disabled, which is done through a second web API. That API accepts a JSON body wholesale with no server-side validation on *which* fields matter — so an attacker can smuggle in a `__proto__` payload that flips privilege flags (`admin: true`, `isAdmin: true`, `role: admin`) via **prototype pollution**. The app ends up trusting attacker-controlled "admin" state purely because it never scoped what the client was allowed to send.

### 5. Break the kiosk out of kiosk mode

With the scanner disabled through the admin bypass, triggering a "scan" on the kiosk UI throws an application error dialog instead of failing silently. That error dialog has a clickable support link — which opens a real browser window inside the locked-down kiosk session. From there, a classic GUI-breakout trick applies: type a local file path (`C:\Windows\System32\cmd.exe`) into the address bar instead of a URL. Windows Explorer / the browser's file handling resolves it and hands over a command prompt, escaping the kiosk shell entirely.

### 6. Shell on the box, then pivot to an actual reverse shell

From the restricted kiosk account, drop a static `nc.exe` (or similar) from an attacker-controlled web server using a living-off-the-land downloader, then catch a proper reverse shell. User flag sits on the desktop at this point.

### 7. Hunt for leftover config instead of attacking anything new

No further exploit is needed — the box's own automation gives root away. The kiosk application ships with a backend config file holding a MySQL replica account, and a scheduled task / batch script (`refresh-dates.bat`) in `ProgramData` that calls MySQL with the **root** password in plaintext to refresh demo data. Reading that one file is enough to get full database access as root.

### 8. From "root on MySQL" to "root on Windows"

A database root account on a machine where you already have a foothold is a classic **MySQL UDF (User-Defined Function) privilege escalation**: drop a UDF library into MySQL's plugin directory (writable because of the account's permissions), register a function from it (`sys_eval`), and that function now executes arbitrary OS commands with the privileges of the MySQL service — which on this box is SYSTEM. Reading the root flag off the Administrator desktop confirms it.

## What this taught me about the system

- **How it worked:** a kiosk app trusted client-submitted state (prototype pollution bypassing an authorization check), a support/error flow leaked a browser escape hatch, and an automation script left a privileged database password in plaintext on disk — three unrelated weak links that only matter chained together.
- **Well-configured instead:** validate and allow-list JSON payload fields server-side (never merge raw client JSON into app state); lock down kiosk browsers properly (no address bar, no file:// handling, restricted error dialogs); never hardcode privileged credentials in scheduled tasks — use a secrets manager or a scoped service account; restrict the MySQL `plugin_dir` so UDF-based privesc isn't possible even with root DB creds.
- **Infra takeaway:** kiosk / locked-down endpoints need the same hardening discipline as servers — a "public" terminal with a browser underneath is still a full Windows host until proven otherwise. Also: grep for plaintext credentials in `ProgramData` and scheduled tasks during any Windows assessment, it's a recurring pattern.

## Key takeaways / lessons learned
- Build the full chain mentally before touching a command — each artifact (a code, a hint string, an error dialog) usually points to the *next* step, not the final one.
- Client-side trust (accepting arbitrary JSON, or a GUI kiosk shell) is almost always the weak link on "Easy" boxes.
- A scheduled task or batch script is a very common place to find leftover secrets on Windows.
- MySQL root != OS root, but it's one UDF away from it when the plugin directory is writable.

## Tools used
- nmap
- curl
- a web browser (for the kiosk breakout)
- xfreerdp
- netcat
- MySQL client
- Metasploit's `lib_mysqludf_sys` payload

## Related
- [Layover (Season 12)](layover.md) — earlier box in the chain, source of the initial name/booking code.
