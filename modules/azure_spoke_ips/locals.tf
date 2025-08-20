# spoke gateway IPs for Azure

locals {
  azure_spoke_gateway_ips = merge([
    for region, gws in var.azure_spoke_regions : {
      for gw_key, gw in gws :
      "${region}-${gw_key}" => {
        name                = gw.name
        resource_group_name = gw.resource_group_name
        location            = gw.location
      }
    }
  ]...)

  all_azure_spoke_gateway_ips_list = [
    for gw in azurerm_public_ip.spoke_gateway_ips : gw.ip_address
  ]

}