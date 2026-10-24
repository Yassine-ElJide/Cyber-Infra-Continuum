# Azure IAM — starter outline

## Core concepts

- **Microsoft Entra ID** (formerly Azure AD): identity provider for Azure, tenants, users, groups
- **RBAC**: role assignments scoped to management group / subscription / resource group / resource
- **Built-in roles**: Owner, Contributor, Reader, and service-specific roles — prefer built-in over custom when possible
- **Managed identities**: system-assigned or user-assigned identities for resources to authenticate without stored credentials

## Practical checklist

- [ ] Use groups for role assignment, not individual users, for easier audit and offboarding
- [ ] Apply RBAC at the narrowest scope that makes sense (resource group, not subscription)
- [ ] Use managed identities instead of secrets/connection strings wherever a resource supports it
- [ ] Enable Conditional Access and MFA for privileged roles
- [ ] Review Azure Policy for guardrails (allowed regions, required tags, SKU restrictions)
- [ ] Rotate and vault any secrets that can't be replaced by managed identity (Key Vault)

## Commands to know

```bash
az role assignment create --assignee <id> --role "Reader" --scope <resource-id>
az ad group member add --group <group> --member-id <user-object-id>
az identity create -g <rg> -n <identity-name>
```

## Things to dig into further

- Privileged Identity Management (PIM) for just-in-time elevation
- Custom role definitions and when they're actually justified
- Cross-tenant access settings for B2B scenarios
