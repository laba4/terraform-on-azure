# Azure CLI Authentication

## Sign In Interactively

```bash
az login
```

## Service Principal with Client Secret

```bash
az login \
  --service-principal -u "appId" \
  -p "password" \
  --tenant "tenant"
```

- After that, run `export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"`
- Alternatively, the env vars can also be exported instead of passing them to the `az login` command in-line

```bash
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
```

- At this point, running either `terraform plan` or `terraform apply` should allow Terraform to authenticate using the Service Principal

```hcl
variable "client_secret" {
}

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = "00000000-0000-0000-0000-000000000000"
  client_secret   = var.client_secret
  tenant_id       = "10000000-0000-0000-0000-000000000000"
  subscription_id = "20000000-0000-0000-0000-000000000000"
}
```

- Storing all values directly inside the providers file is risky and should be avoided
- Secret values can be passed by using `terraform apply -var "client_secret=my_secret_pw"`