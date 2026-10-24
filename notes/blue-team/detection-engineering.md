# Detection engineering — starter notes

Kept here mainly so I understand what "good" looks like on the defending side. Not my main focus (that's infra/cloud), but it shapes how I build systems.

## Core idea

Detection engineering turns known attack behaviors into monitored signals: a log source, a rule, and a response action.

## Common log sources

| Source | What it gives you |
|---|---|
| Windows Event Logs (Security, Sysmon) | Process creation, logons, privilege use |
| Linux auditd | Syscalls, file access, command execution |
| Cloud provider logs (Azure Activity Log, AWS CloudTrail) | API calls, IAM changes, resource changes |
| Web/proxy logs | Requests, user agents, status codes |

## A simple detection lifecycle

1. Pick a technique (e.g., Kerberoasting, suspicious scheduled task)
2. Identify the log event(s) it generates
3. Write a rule (SIEM query, Sigma rule) for that pattern
4. Test against both the attack and normal activity (reduce false positives)
5. Define the response: alert, auto-contain, or just log for context

## Infra-minded takeaway

Good detection starts with good logging defaults — if a service doesn't log authentication and config changes by default, no rule can see it. As an infra engineer, enabling the right audit logs on every resource I provision is a bigger lever than any individual detection rule.
