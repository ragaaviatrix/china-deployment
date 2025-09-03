resource "aws_eip" "transit_gateway_ips" {
  for_each = local.all_aws_transit_gateway_ips

  region   = each.value.region
  tags     = each.value.tags
  provider = aws.aws_cnn1

}

resource "azurerm_network_security_rule" "tcp443_all_aws_transit_gateways" {
  name                       = "tcp443_all_aws_transit_gateways"
  priority                   = 1010
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "443"
  source_address_prefixes    = local.all_aws_transit_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.controller_nsg_name
}

# UDP 5000 rule
resource "azurerm_network_security_rule" "udp5000_all_aws_transit_gateways" {
  name                       = "udp5000_all_aws_transit_gateways"
  priority                   = 2010
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Udp"
  source_port_range          = "*"
  destination_port_range     = "5000"
  source_address_prefixes    = local.all_aws_transit_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}

# UDP 31283 rule
resource "azurerm_network_security_rule" "udp31283_all_aws_transit_gateways" {
  name                       = "udp31283_all_aws_transit_gateways"
  priority                   = 3010
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Udp"
  source_port_range          = "*"
  destination_port_range     = "31283"
  source_address_prefixes    = local.all_aws_transit_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}

# module "aws_transit_gateway" {
#   source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
#   version = "8.0.0"

#   cloud           = "aws"
#   region          = "cn-north-1" # Replace with actual region
#   cidr            = "10.188.4.0/23"
#   account         = "aws-skf-china"
#   name = "skf-aws-transit-vpc"
#   gw_name         = "aws-china-transit-gateway"
#   instance_size   = "c5.xlarge"
#   local_as_number = "64566"
#   allocate_new_eip = false
#   eip =    "43.196.65.53"
#   ha_eip = "140.179.124.62"

# }