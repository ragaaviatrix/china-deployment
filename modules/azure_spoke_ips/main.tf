resource "azurerm_public_ip" "spoke_gateway_ips" {
  for_each = local.azure_spoke_gateway_ips

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}


