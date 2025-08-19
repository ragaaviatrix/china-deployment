resource "aws_eip" "spoke_gateway_ips" {
  for_each = local.aws_spoke_gateway_ips

  region = each.value.region

}

resource "azurerm_network_security_rule" "tcp443_all_aws_spoke_gateways" {
  name                       = "tcp443_all_aws_spoke_gateways"
  priority                   = 1110
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "443"
  source_address_prefixes    = local.all_aws_spoke_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.controller_nsg_name
}

# UDP 5000 rule
resource "azurerm_network_security_rule" "udp5000_all_aws_spoke_gateways" {
  name                       = "udp5000_all_aws_spoke_gateways"
  priority                   = 2110
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Udp"
  source_port_range          = "*"
  destination_port_range     = "5000"
  source_address_prefixes    = local.all_aws_spoke_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}

# UDP 31283 rule
resource "azurerm_network_security_rule" "udp31283_all_aws_spoke_gateways" {
  name                       = "udp31283_all_aws_spoke_gateways"
  priority                   = 3110
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Udp"
  source_port_range          = "*"
  destination_port_range     = "31283"
  source_address_prefixes    = local.all_aws_spoke_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}

# module "aws_spoke_gateway" {
#   source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
#   version = "2.6.0"

#   cloud           = "aws"
#   region          = "region_name" # Replace with actual region
#   cidr            = "10.188.4.0/23"
#   account         = "skf-aws"
#   name = "skf-aws-transit-vpc"
#   gw_name         = "aws-china-transit-gateway"
#   instance_size   = "c6in.large"
#   local_as_number = "64566"
#   allocate_new_eip = false
#   eip =    "54.225.171.21"
#   ha_eip = "44.212.232.57"

# }