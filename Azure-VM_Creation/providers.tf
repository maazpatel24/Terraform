terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.46.0"
    }
  }
}

provider "azurerm" {
  features {
    # virtual_machine {
    #   delete_os_disk_on_deletion     = true
    #   skip_shutdown_and_force_delete = true
    # }  
  }
  skip_provider_registration = true

}
