resource "azurerm_public_ip" "transit_gateway_ips" {
  for_each = local.all_azure_transit_gateway_ips

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}


resource "azurerm_network_security_rule" "tcp443_all_azure_transit_gateways" {
  name                       = "tcp443_all_azure_transit_gateways"
  priority                   = 1000
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "443"
  source_address_prefixes    = local.all_azure_transit_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.controller_nsg_name
}

# UDP 5000 rule
resource "azurerm_network_security_rule" "udp5000_all_azure_transit_gateways" {
  name                       = "udp5000_all_azure_transit_gateways"
  priority                   = 2000
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Udp"
  source_port_range          = "*"
  destination_port_range     = "5000"
  source_address_prefixes    = local.all_azure_transit_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}

# UDP 31283 rule
resource "azurerm_network_security_rule" "udp31283_all_azure_transit_gateways" {
  name                       = "udp31283_all_azure_transit_gateways"
  priority                   = 3000
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Udp"
  source_port_range          = "*"
  destination_port_range     = "31283"
  source_address_prefixes    = local.all_azure_transit_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}



# module "azure_transit_gateway" {
#   source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
#   version = "2.6.0"

#   cloud           = "azure"
#   region          = "China North 3"
#   cidr            = "10.188.2.0/23"
#   account         = "skf-china"
#   gw_name         = "china-transit-gateway"
#   resource_group  = "transit-rg-chn3" 
#   instance_size   = "Standard_D4s_v5"
#   local_as_number = "64565"
#   allocate_new_eip = false
#   azure_eip_name_resource_group = "chn3primarygwip:transit-rg-chn3" #'IP_Name:Resource_Group_Name'
#   eip =    "40.162.89.200"
#   ha_azure_eip_name_resource_group = "chn3hagwip:transit-rg-chn3" #'IP_Name:Resource_Group_Name'
#   ha_eip = "159.27.50.110"

# }

