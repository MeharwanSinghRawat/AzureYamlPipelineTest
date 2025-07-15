terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "meharBackend"
    storage_account_name = "johny121stg12"
    container_name       = "backupcontainer"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
  subscription_id = "5878055b-ed6d-4f89-b493-40fc80beaded"
}