# Terraform / IaC — starter outline

## Core concepts

- **Providers**: plugins that talk to a specific API (azurerm, aws, kubernetes, …)
- **Resources** vs **data sources**: things Terraform manages vs things it just reads
- **State**: Terraform's record of what it created — must be stored remotely and locked for team use
- **Modules**: reusable, parameterized groups of resources

## Practical checklist

- [ ] Remote state backend with locking (e.g., Azure Storage + state lock, S3 + DynamoDB)
- [ ] Never commit `*.tfstate` or `*.tfvars` with secrets (covered by `.gitignore` here)
- [ ] Use `terraform plan` output as a required review step before `apply`
- [ ] Pin provider and module versions
- [ ] Separate environments (dev/staging/prod) via workspaces or distinct state files, not branches alone
- [ ] Use variables + `tfvars` per environment instead of hardcoding values

## Commands to know

```bash
terraform init
terraform plan -out=plan.tfplan
terraform apply plan.tfplan
terraform state list
terraform import <resource_address> <existing_resource_id>
```

## Things to dig into further

- Policy as code (Sentinel / OPA) to enforce guardrails on plans
- Module registries and versioning strategy
- Drift detection in CI pipelines
