# spoke gateway IPs for AWS

locals {
  aws_spoke_gateway_ips = merge([
    for region, gws in var.aws_spoke_regions : {
      for gw_key, gw in gws :
      "${region}-${gw_key}" => {
        region = gw.region
        tags   = gw.tags
      }
    }
  ]...)

  all_aws_spoke_gateway_ips_list = [
    for gw in aws_eip.spoke_gateway_ips : gw.public_ip
  ]
}