# Note-taking conventions

This repo is my personal knowledge base, so a few rules keep it consistent and safe to publish.

## Golden rules

1. **Retired machines only.** Never publish a writeup for an active HTB machine. Check the box is retired, then tick the `RETIRED` checkbox in the writeup header.
2. **No secrets, ever.** No flags, passwords, hashes, tokens, VPN files, or real IPs from non-lab environments. `.gitignore` is a safety net, not a substitute for checking.
3. **Nothing from my employer.** No internal hostnames, architectures, or anything from CNP Assurances or any client environment.
4. **Own words.** Writeups and notes are written in my own words. Link to official docs and sources rather than copying them.

## Where things go

| Content | Location |
|---|---|
| HTB machine writeups | `htb/machines/<linux\|windows>/<name>.md` |
| HTB Pro Lab writeups | `htb/pro-labs/<lab-name>.md` |
| Certification notes | `certifications/<domain>/notes.md` |
| Cheatsheets & reference | `notes/<topic>/<file>.md` |

## File naming

- lowercase, hyphen-separated: `linux-privesc.md`, `azure-iam.md`
- machine writeups use the machine name in lowercase: `blue.md`

## Writeup structure

Always start from a template in `templates/` (or run `scripts/new-writeup.sh`):

1. Summary
2. Enumeration
3. Foothold
4. Privilege escalation
5. **What this taught me about the system**: how it worked under the hood and what a well-configured environment would do differently (keep it practical and infra-minded)
6. Key takeaways
7. Tools used

## Commit messages

Short, imperative, prefixed by area:

```
htb: add Blue writeup
cert(azure): AZ-104 identity & governance notes
notes(pentest): extend pivoting cheatsheet
repo: update progress tables
```

## Progress tables

After each new writeup or cert milestone, update both:
- the root `README.md` tables
- `certifications/README.md` (certification status)
