resource "aws_eip" "transit_gateway_ips" {
  for_each = local.all_gateway_ips_aws

  region            = each.value.region

}

resource "azurerm_network_security_rule" "all_transit_gateway_ips_aws" {
  name                        = "tcp443_all_gateways_aws"
  priority                    = 1010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = local.all_gateway_ips_list_aws
  destination_address_prefix  = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.controller_nsg_name
}

# UDP 5000 rule
resource "azurerm_network_security_rule" "udp_5000_rules_aws" {
  name                        = "udp5000_all_gateways_aws"
  priority                    = 2010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "5000"
  source_address_prefixes     = local.all_gateway_ips_list_aws
  destination_address_prefix  = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}

# UDP 31283 rule
resource "azurerm_network_security_rule" "udp_31283_rules_aws" {
  name                        = "udp31283_all_gateways_aws"
  priority                    = 3010
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "31283"
  source_address_prefixes     = local.all_gateway_ips_list_aws
  destination_address_prefix  = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}

module "aws_transit_gateway" {
  source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version = "2.6.0"

  cloud           = "aws"
  region          = "region_name" # Replace with actual region
  cidr            = "10.188.4.0/23"
  account         = "skf-aws"
  name = "skf-aws-transit-vpc"
  gw_name         = "aws-china-transit-gateway"
  instance_size   = "c6in.large"
  local_as_number = "64566"
  allocate_new_eip = false
  eip =    "54.225.171.21"
  ha_eip = "44.212.232.57"

}