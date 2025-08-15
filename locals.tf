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

locals {
  all_gateway_ips_aws = merge(
    { for key, data in var.aws_transit_regions :
      "${key}-primary" => { region = data.primary_gw.region }
    },
    { for key, data in var.aws_transit_regions :
      "${key}-ha" => { region = data.ha_gw.region }
    }
  )
  all_gateway_ips_list_aws = [
    for gw in aws_eip.transit_gateway_ips: gw.public_ip
  ]
}
