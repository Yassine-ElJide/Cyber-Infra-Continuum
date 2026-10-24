# Certification roadmap

My two focus tracks are **Cloud** and **AI**. The order below is deliberate: each step builds on the previous one.

## Roadmap

### 1. RHCSA: Linux foundation
**Why:** everything else (containers, Kubernetes, cloud VMs, GPU nodes) sits on Linux. → [notes](rhcsa/notes.md)

### 2. Docker: containers
**Why:** containers are the packaging unit of modern infrastructure and the prerequisite for Kubernetes. → [notes](docker/notes.md)

### 3. Kubernetes (CKA): orchestration
**Why:** builds directly on Docker; the standard platform for running workloads at scale. → [notes](kubernetes/notes.md)

### 4. Terraform (Associate): Infrastructure as Code
**Why:** reproducible, reviewable infrastructure across any cloud. → [notes](terraform/notes.md)

### 5. Git / GitLab: version control + CI/CD
**Why:** the backbone of modern infra work; every pipeline and IaC change flows through it. → [notes](git-gitlab/notes.md)

### 6. Cloud / Azure (AZ-104, then AZ-500)
**Why:** my strongest current cloud; AZ-104 for administration, AZ-500 for the security layer of Azure infra. → [notes](cloud/azure/notes.md)

### 7. Cloud / AWS (SAA, later DevOps)
**Why:** second provider, broadens my market and makes me genuinely multi-cloud. → [notes](cloud/aws/notes.md)

### 8. AI / NVIDIA AI Infrastructure
**Why:** building and operating AI infrastructure (GPUs, clusters, pipelines). → [notes](ai/notes.md)

### 9. AI Security
**Why:** securing AI/LLM systems (OWASP LLM Top 10, prompt injection, model and data pipeline security). → [notes](ai-security/notes.md)

> **Forward-looking bet:** AI and AI Security sit exactly at the intersection of my infra/cloud background and where the industry is heading. Someone who can build the platform *and* understand how to secure it will be in demand.

```
RHCSA ─▶ Docker ─▶ Kubernetes ─▶ Terraform ─▶ Git/GitLab ─▶ Azure ─▶ AWS ─▶ AI Infra ─▶ AI Security
 Linux     containers  orchestration    IaC        CI/CD       cloud #1  cloud #2   AI track     AI track
```

The order is a guide, not a rule. I'll interleave tracks as work and opportunities dictate.

## Master progress table

| Domain | Certification | Status | Target date |
|---|---|---|---|
| Cloud: Azure | [AZ-104 / AZ-500](cloud/azure/notes.md) | Planned | TBD |
| Cloud: AWS | [SAA / DevOps](cloud/aws/notes.md) | Planned | TBD |
| Docker | [Docker](docker/notes.md) | Planned | TBD |
| Kubernetes | [CKA](kubernetes/notes.md) | Planned | TBD |
| Terraform | [Terraform Associate](terraform/notes.md) | Planned | TBD |
| Git / GitLab | [Git fundamentals + GitLab CI/CD](git-gitlab/notes.md) | Planned | TBD |
| RHCSA | [Linux foundation](rhcsa/notes.md) | Planned | TBD |
| AI | [NVIDIA AI Infrastructure](ai/notes.md) | Planned | TBD |
| AI Security | [Securing AI/LLM systems](ai-security/notes.md) | Planned | TBD |

Status values: **Planned** / **Studying** / **Passed**. Keep this table in sync with the [root README](../README.md).
