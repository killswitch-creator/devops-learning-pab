# This is like saying "I'm using an Azure router"
provider "azurerm" {
  features {}
}

# This creates a "Resource Group" (a folder for my network)
resource "azurerm_resource_group" "lab_rg" {
  name     = "DevOps-Lab-RG"
  location = "East US"
}

# This is my "Global Config" for the Network
resource "azurerm_virtual_network" "lab_vnet" {
  name                = "Lab-VNet"
  address_space       = ["10.0.0.0/16"] # my CIDR block
  location            = azurerm_resource_group.lab_rg.location
  resource_group_name = azurerm_resource_group.lab_rg.name
}

# This is like creating a VLAN or a specific Subnet
resource "azurerm_subnet" "lab_subnet" {
  name                 = "FrontEnd-Subnet"
  resource_group_name  = azurerm_resource_group.lab_rg.name
  virtual_network_name = azurerm_virtual_network.lab_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}) 