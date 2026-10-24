# Kubernetes: CKA

| | |
|---|---|
| **Provider** | CNCF / Linux Foundation |
| **Status** | Planned |
| **Target / exam date** | TBD |

## Why I'm doing this

Kubernetes is the standard platform for running workloads at scale. CKA is hands-on, so it proves real operational skill.

## Resources I'm using

- **Course:** TBD
- **Official docs:** kubernetes.io/docs (allowed during the exam)
- **Labs / practice:** kind/minikube, killer.sh simulator

## Running notes by exam domain

### Cluster architecture, installation and configuration
- Control plane components, kubeadm, RBAC, etcd backup/restore

### Workloads and scheduling
- Deployments, rollouts, ConfigMaps/Secrets, scheduling, resource limits

### Services and networking
- Services, Ingress, NetworkPolicy, CoreDNS

### Storage
- PV/PVC, StorageClasses, access modes

### Troubleshooting
- Node and pod failures, logs, events, kubelet and control-plane issues

## Hands-on proof

```bash
# kubectl get pods -A: list all pods across namespaces
# kubectl describe pod <name>: inspect events and state
```

## Pre-exam checklist

- [ ] All exam domains covered in notes
- [ ] Practice exams scored consistently above target
- [ ] Hands-on labs completed for each domain
- [ ] Weak areas re-reviewed
- [ ] Exam booked, ID and environment checked
