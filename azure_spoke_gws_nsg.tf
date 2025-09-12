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
}


# module "spoke_azure_1" {
#   source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
#   version = "8.0.0"

#   cloud            = "Azure"
#   name             = "skf-spoke1-chn3"
#   region           = "China North 3"
#   account          = "skf-china"
#   attached = false
#   use_existing_vpc = true
#   vpc_id           = "skf-spoke1-chn3:spoke-rg-chn3:88fe354d-24d1-49c3-b199-871aa2680420"
#   gw_subnet        = "10.250.0.0/28"
#   hagw_subnet      = "10.250.0.0/28"
#   azure_eip_name_resource_group = "chn3spoke1gwip:spoke-rg-chn3" #'IP_Name:Resource_Group_Name'
#   eip =    "40.162.95.22"
#   ha_azure_eip_name_resource_group = "chn3spoke2gwip:spoke-rg-chn3" #'IP_Name:Resource_Group_Name'
#   ha_eip = "40.162.17.243"
#   single_ip_snat   = true
#   allocate_new_eip = false
# }