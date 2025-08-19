resource "azurerm_public_ip" "spoke_gateway_ips" {
  for_each = local.azure_spoke_gateway_ips

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}

resource "azurerm_network_security_rule" "tcp443_all_azure_spoke_gateways" {
  name                       = "tcp443_all_azure_spoke_gateways"
  priority                   = 1100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "443"
  source_address_prefixes    = local.all_azure_spoke_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.controller_nsg_name
}

# UDP 5000 rule
resource "azurerm_network_security_rule" "udp5000_all_azure_spoke_gateways" {
  name                       = "udp5000_all_azure_spoke_gateways"
  priority                   = 2100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Udp"
  source_port_range          = "*"
  destination_port_range     = "5000"
  source_address_prefixes    = local.all_azure_spoke_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}

# UDP 31283 rule
resource "azurerm_network_security_rule" "udp31283_all_azure_spoke_gateways" {
  name                       = "udp31283_all_azure_spoke_gateways"
  priority                   = 3100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Udp"
  source_port_range          = "*"
  destination_port_range     = "31283"
  source_address_prefixes    = local.all_azure_spoke_gateway_ips_list
  destination_address_prefix = "*"

  resource_group_name         = var.controller_resource_group_name
  network_security_group_name = var.copilot_nsg_name
}