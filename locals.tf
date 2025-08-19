# transit gateway IPs for Azure
locals {
  all_azure_transit_gateway_ips = merge(
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
  all_azure_transit_gateway_ips_list = [
    for gw in azurerm_public_ip.transit_gateway_ips : gw.ip_address
  ]
}

# transit gateway IPs for AWS
locals {
  all_aws_transit_gateway_ips = merge(
    { for key, data in var.aws_transit_regions :
      "${key}-primary" => { region = data.primary_gw.region }
    },
    { for key, data in var.aws_transit_regions :
      "${key}-ha" => { region = data.ha_gw.region }
    }
  )
  all_aws_transit_gateway_ips_list = [
    for gw in aws_eip.transit_gateway_ips : gw.public_ip
  ]
}

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

# spoke gateway IPs for AWS

locals {
  aws_spoke_gateway_ips = merge([
    for region, gws in var.aws_spoke_regions : {
      for gw_key, gw in gws :
      "${region}-${gw_key}" => {
        region = gw.region
      }
    }
  ]...)

  all_aws_spoke_gateway_ips_list = [
    for gw in aws_eip.spoke_gateway_ips : gw.public_ip
  ]
}