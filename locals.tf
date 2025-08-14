locals {
  all_gateway_ips = merge(
    { for region, data in var.azure_transit_regions :
      "${region}-primary" => {
        name                = data.primary_gw.name
        resource_group_name = data.primary_gw.resource_group_name
        location            = data.primary_gw.location
      }
    },
    { for region, data in var.azure_transit_regions :
      "${region}-ha" => {
        name                = data.ha_gw.name
        resource_group_name = data.ha_gw.resource_group_name
        location            = data.ha_gw.location
      }
    }
  )
  all_gateway_ips_list = [
    for gw in azurerm_public_ip.transit_gateway_ips : gw.ip_address
  ]
}

