terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.7.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.9.1"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}