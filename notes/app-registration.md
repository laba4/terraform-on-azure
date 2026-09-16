# Azure App Registration

## Create Service Principal

```bash
az ad sp create-for-rbac \
  --role Contributor \
  --scopes /subscriptions/00000000-0000-0000-0000-000000000000
```
