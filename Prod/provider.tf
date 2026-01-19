terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "rg_Tanu"
    storage_account_name  = "statefile12345"
    container_name        = "statecontainer"
    key                   = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2af63522-f4cf-47c6-a535-08dbd21adcad"
}