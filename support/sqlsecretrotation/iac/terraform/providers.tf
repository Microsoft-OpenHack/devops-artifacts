terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.94.0"
    }
  }
  backend "azurerm" {
  }
}

data "azurerm_client_config" "current" {}

provider "azurerm" {
  features {}
}