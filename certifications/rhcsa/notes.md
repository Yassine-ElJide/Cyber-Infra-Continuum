# RHCSA: Red Hat Certified System Administrator

| | |
|---|---|
| **Provider** | Red Hat |
| **Status** | Planned |
| **Target / exam date** | TBD |

## Why I'm doing this

Linux is the foundation everything else sits on: containers, Kubernetes, cloud VMs, GPU nodes. RHCSA is a hands-on exam that proves it.

## Resources I'm using

- **Course:** TBD
- **Official docs:** Red Hat documentation, `man` pages
- **Labs / practice:** local RHEL-compatible VMs (Rocky/Alma)

## Running notes by exam domain

### Essential tools
- Shell, redirection, grep/sed/awk, archives, file permissions, `man`

### Operating running systems
- systemd, boot targets, processes, tuned, logs/journald

### Local storage and file systems
- LVM, partitions, XFS, `fstab`, swap

### Users, groups and security
- sudoers, ACLs, SELinux (modes, contexts, booleans), firewalld

### Networking
- NetworkManager (`nmcli`), hostname, DNS, SSH

### Software and containers
- dnf/repos, rpm, Podman basics

## Hands-on proof

```bash
# lvcreate -L 2G -n lv_data vg0: create a logical volume
# semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?": set an SELinux file context
```

## Pre-exam checklist

- [ ] All exam domains covered in notes
- [ ] Practice exams scored consistently above target
- [ ] Hands-on labs completed for each domain
- [ ] Weak areas re-reviewed
- [ ] Exam booked, ID and environment checked
