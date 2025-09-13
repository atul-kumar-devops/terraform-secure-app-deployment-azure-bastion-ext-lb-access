terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "State-Management"
    storage_account_name = "statemanagement434"
    container_name       = "tfstate"
    key                  = "prod/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "51984565-3b14-41c7-900f-cf01ff601798"
}
