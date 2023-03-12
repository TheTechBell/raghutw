terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "location" {
  default = "eastus"
}

variable "resource_group_name" {
  default = "my-aks-rg"
}

variable "aks_name" {
  default = "my-aks"
}

variable "node_count" {
  default = 1
}

variable "node_vm_size" {
  default = "Standard_DS2_v2"
}

variable "admin_username" {}

variable "ssh_public_key" {}

variable "service_principal_id" {}

variable "service_principal_secret" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_service" "aks" {
  depends_on = [
    azurerm_resource_group.rg,
  ]

  name                = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_name
  node_resource_group = azurerm_resource_group.rg.name

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.node_vm_size
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.service_principal_id
    client_secret = var.service_principal_secret
  }

  tags = {
    Environment = "dev"
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  depends_on = [
    azurerm_resource_group.rg,
  ]

  name                = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_name

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.node_vm_size
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.service_principal_id
    client_secret = var.service_principal_secret
  }

  tags = {
    Environment = "dev"
  }
}

