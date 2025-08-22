resource "aws_eip" "spoke_gateway_ips" {
  for_each = local.aws_spoke_gateway_ips

  region = each.value.region
  tags = each.value.tags

}

resource "azurerm_network_security_rule" "tcp443_all_aws_spoke_gateways" {
  name                       = "${var.acc_id}_tcp443_all_aws_spoke_gateways"
  priority                   = var.tcp443_priority
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
  name                       = "${var.acc_id}_udp5000_all_aws_spoke_gateways"
  priority                   = var.udp5000_priority
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
  name                       = "${var.acc_id}_udp31283_all_aws_spoke_gateways"
  priority                   = var.udp31283_priority
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
