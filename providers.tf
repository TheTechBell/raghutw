terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
#    random = {
#      source  = "hashicorp/random"
#      version = "~>3.0"
#    }
#    tls = {
#      source = "hashicorp/tls"
#      version = "~>4.0"
#    }
  }
}

provider "azurerm" {
  features {}
}








#provider "azurerm" {
#  # The "feature" block is required for AzureRM provider 2.x.
#  # If you are using version 1.x, the "features" block is not allowed.
#  #version = "~>2.0"
#  features {}
#}

