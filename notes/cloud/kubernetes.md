# Kubernetes — starter outline

## Core objects

- **Pod**: smallest deployable unit, one or more containers sharing network/storage
- **Deployment**: manages ReplicaSets, rolling updates, desired state
- **Service**: stable network identity for a set of pods (ClusterIP, NodePort, LoadBalancer)
- **Ingress**: HTTP(S) routing into the cluster
- **ConfigMap / Secret**: configuration and sensitive values injected into pods
- **Namespace**: logical isolation boundary within a cluster

## Practical checklist

- [ ] Set resource `requests`/`limits` on every workload
- [ ] Use `readinessProbe`/`livenessProbe` for every deployment
- [ ] Namespace-scope RBAC rather than cluster-wide by default
- [ ] NetworkPolicies to restrict pod-to-pod traffic (default-deny, then allow what's needed)
- [ ] Secrets backed by a real secret store (Vault, cloud KMS) where possible, not just base64 in etcd
- [ ] Image provenance: pinned tags/digests, scanned images, no `:latest` in production

## Commands to know

```bash
kubectl get pods -A
kubectl rollout status deployment/<name>
kubectl describe pod <name>
kubectl logs -f <pod> -c <container>
kubectl apply -f manifest.yaml --dry-run=client
```

## Things to dig into further

- Horizontal Pod Autoscaler vs Vertical Pod Autoscaler
- Pod Security Admission / Pod Security Standards
- GitOps delivery (Argo CD / Flux) for cluster state
