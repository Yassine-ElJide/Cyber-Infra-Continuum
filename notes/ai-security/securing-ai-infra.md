# Securing AI infrastructure — starter outline

Infra-minded security for the platform running AI workloads, not the model behavior itself (see `llm-threats.md` for that).

## Layers to secure

| Layer | Concerns |
|---|---|
| Data | Training/eval data access control, lineage, encryption at rest/in transit |
| Model artifacts | Access control on model registries, integrity checking (signing/hashing) |
| Compute (GPU nodes) | Node isolation, driver/firmware patching, multi-tenant isolation |
| Orchestration | Kubernetes RBAC and NetworkPolicy applied to AI namespaces same as anything else |
| Inference endpoints | AuthN/authZ, rate limiting, input size limits, output filtering |
| Pipelines (CI/CD for ML) | Secrets handling, reproducibility, dependency scanning |

## Practical checklist

- [ ] Model registry access scoped like any other sensitive artifact store
- [ ] Data pipelines run with least-privilege service identities
- [ ] GPU nodes patched and isolated the same rigor as any other compute tier
- [ ] Inference endpoints behind the same API gateway/auth patterns as other services
- [ ] Monitor cost and usage anomalies (also a security signal — unexpected usage spikes)
- [ ] Separate environments for experimentation vs production inference

## Things to dig into further

- Confidential computing for sensitive training data
- Model watermarking / provenance tracking
- Multi-tenant GPU cluster isolation patterns
