# resource "azurerm_resource_group" "maaz_rg" {
#   name     = "sa1_test_eic_MaazPatel"
#   location = "Southeast Asia"
# }

# Use this data source to access information about an existing Resource Group.
data "azurerm_resource_group" "maaz_rg" {
  name = var.resource_group_name
  #   location = var.resource_group_location
}

# output "id" {
#   value = data.azurerm_resource_group.maaz_rg.id
# }

# Creating Virtual Network
resource "azurerm_virtual_network" "example_vnet" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.maaz_rg.location
  resource_group_name = data.azurerm_resource_group.maaz_rg.name
}

# Creating Subnet
resource "azurerm_subnet" "example_subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.maaz_rg.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Creating Network interface
resource "azurerm_network_interface" "example_nic" {
  name                = var.network_interface_name
  location            = data.azurerm_resource_group.maaz_rg.location
  resource_group_name = data.azurerm_resource_group.maaz_rg.name

  ip_configuration {
    name                          = "my_nic_internal"
    subnet_id                     = azurerm_subnet.example_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create Virtual Machine
resource "azurerm_linux_virtual_machine" "example_linux_vm" {
  name                = "testingExample-vm"
  resource_group_name = data.azurerm_resource_group.maaz_rg.name
  location            = data.azurerm_resource_group.maaz_rg.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser-maaz"
  network_interface_ids = [
    azurerm_network_interface.example_nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser-maaz"
    public_key = file("/home/einfochips/Desktop/OneDrive/Terraform/azure-vm/.ssh/id_rsa.pub") # location of my ssh-pubilic key.
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    Resource_Owner : "Your name"
    Delivery_Manager : "Shriram Deshpande"
    Sub_Business_Unit : "PES-IA"
    Business_Unit : "einfochips"
    Project_Name : "Training and learning"
    Create_Date : "16 Feb 2024"
  }
}
