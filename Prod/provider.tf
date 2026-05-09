terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }

  backend "azurerm" {
    tenant_id            = "7d0fbc2b-70c4-4daa-a3e2-0b2f29f8c034"  
    subscription_id      = "db443927-390d-4e00-aac6-f5fa50dd047f"  
    client_id            = "e60798f7-66b9-43c3-a446-8380135c7305"
    resource_group_name   = "rg_tanu"
    storage_account_name  = "storageacctanu"
    container_name        = "tfstate"
    key                   = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "db443927-390d-4e00-aac6-f5fa50dd047f"
}