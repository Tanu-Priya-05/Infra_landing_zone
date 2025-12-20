terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "rg_Tanu"
    storage_account_name  = "statefile123"
    container_name        = "statecontainer"
    key                   = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "98473d5b-c639-404e-9bf2-91559fe65ff8"
}