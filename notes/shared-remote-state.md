# Terraform Shared Remote State

A local state file only works when you work on a Terraform project alone. However, as soon as more than one person needs to make changes, conflicts can happen. A shared remote state locks the state file in the remote storage container as soon as someone initiates a change. This prevents others from overwriting the state.

## Create Resource Group

```bash
az group create --name rg-terraform --location switzerlandnorth
```

- Resource group for the storage account where the remote state will get stored

## Create Storage Account and Container

```bash
az storage account create \
  --name mytfstateacc \
  --resource-group rg-terraform \
  --location switzerlandnorth \
  --sku Standard_LRS

az storage container create \
  --name tfstate \
  --account-name mytfstateacc
```

## Add empty Backend Block

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.59.0"
    }
  }

  backend "azurerm" {}
}
```

- Backend needs to be empty; arguments are passed dynamically

## Create Backends

```hcl
# dev.tfbackend
resource_group_name  = "rg-terraform"
storage_account_name = "mytfstateacc"
container_name       = "tfstate"
key                  = "dev.tfstate"
```

- Create `dev.tfbackend` and `prod.tfbackend` for example


## Initialize Terraform with a Backend

```bash
terraform init -backend-config="prod.tfbackend"
```

- Use the `-reconfigure` flag to switch back and forth from prod to dev state locally
- If the environments needed to be in different subscriptions, you'd specify `subscription_id` as another backend variable
