output "rg_name" {
  value = data.azurerm_resource_group.maaz_rg.id
  description = "Record the value of resourse-group name, given by the data source"
}