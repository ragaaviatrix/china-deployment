module "azure_spoke_ips_sub1" {
  source = "./modules/azure_spoke_ips"

  azure_spoke_regions            = var.azure_spoke_regions_sub1
  controller_nsg_name            = var.controller_nsg_name
  controller_resource_group_name = var.controller_resource_group_name
  copilot_nsg_name               = var.copilot_nsg_name
  # Use unique priorities for each module to avoid conflicts
  tcp443_priority   = 1100    # increment by 1 for each module
  udp5000_priority  = 2100    # increment by 1 for each module
  udp31283_priority = 3100    # increment by 1 for each module
  sub_id            = "sub_1" # name it as you like

  providers = {
    azurerm = azurerm.spokesub1
  }
}

module "azure_spoke_ips_sub2" {
  source = "./modules/azure_spoke_ips"

  azure_spoke_regions            = var.azure_spoke_regions_sub2
  controller_nsg_name            = var.controller_nsg_name
  controller_resource_group_name = var.controller_resource_group_name
  copilot_nsg_name               = var.copilot_nsg_name
  # Use unique priorities for each module to avoid conflicts
  tcp443_priority   = 1101    # increment by 1 for each module
  udp5000_priority  = 2101    # increment by 1 for each module   
  udp31283_priority = 3101    # increment by 1 for each module
  sub_id            = "sub_2" # name it as you like

  providers = {
    azurerm = azurerm.spokesub2
  }
}