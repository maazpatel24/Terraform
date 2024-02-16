variable "resource_group_name" {
  default = "sa1_test_eic_MaazPatel"
}

variable "resource_group_location" {
  default = "Southeast Asia"
}

variable "virtual_network_name" {
  type    = string
  default = "example-vm-vnet"
}

variable "subnet_name" {
  type    = string
  default = "example-vm-subnet"
}

variable "network_interface_name" {
  type    = string
  default = "maaz_terraform-nic"
}

