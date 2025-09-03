module "azure_spoke_ips_sub1" {
  source = "./modules/azure_spoke_ips"

  azure_spoke_regions = var.azure_spoke_regions_sub1

  providers = {
    azurerm = azurerm.spokesub1
  }
}

module "azure_spoke_ips_sub2" {
  source = "./modules/azure_spoke_ips"

  azure_spoke_regions = var.azure_spoke_regions_sub2


  providers = {
    azurerm = azurerm.spokesub2
  }
}

module "update_azure_spoke_ips_nsg" {
  source = "./modules/update_azure_spoke_gws_nsg"

  all_azure_spoke_gateway_ips_list = flatten([
    module.azure_spoke_ips_sub1.azure_spoke_ips_for_nsg_update,
    module.azure_spoke_ips_sub2.azure_spoke_ips_for_nsg_update
  ])

  controller_nsg_name            = var.controller_nsg_name
  controller_resource_group_name = var.controller_resource_group_name
  copilot_nsg_name               = var.copilot_nsg_name

  providers = {
    azurerm = azurerm.controllersub
  }

  depends_on = [module.azure_spoke_ips_sub1]
}