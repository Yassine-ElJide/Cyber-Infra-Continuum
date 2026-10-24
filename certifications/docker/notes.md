# Docker

| | |
|---|---|
| **Provider** | Docker |
| **Status** | Planned |
| **Target / exam date** | TBD |

## Why I'm doing this

Containers are the packaging unit of modern infrastructure and the foundation for Kubernetes.

## Resources I'm using

- **Course:** TBD
- **Official docs:** docs.docker.com
- **Labs / practice:** local Docker, Play with Docker

## Running notes by exam domain

### Images and Dockerfiles
- Layers, caching, multi-stage builds, minimal base images

### Containers and runtime
- Lifecycle, namespaces and cgroups, resource limits

### Networking and storage
- Bridge/host networks, port mapping, volumes vs bind mounts

### Compose
- Multi-container apps, env files, healthchecks

### Security basics
- Non-root users, read-only filesystems, image scanning, secrets handling

## Hands-on proof

```bash
# docker build -t app:1.0 .: build an image
# docker run --rm -p 8080:80 app:1.0: run it with a port mapping
```

## Pre-exam checklist

- [ ] All exam domains covered in notes
- [ ] Practice exams scored consistently above target
- [ ] Hands-on labs completed for each domain
- [ ] Weak areas re-reviewed
- [ ] Exam booked, ID and environment checked
