output "azure_transit_gateway_ips" {
  value = {
    for key, ip in azurerm_public_ip.transit_gateway_ips :
    key => ip.ip_address
  }
}

output "aws_transit_gateway_ips" {
  description = "Map of AWS Transit Gateway EIP addresses"
  value       = { for key, ip in aws_eip.transit_gateway_ips : key => ip.public_ip }
}

# Azure spoke gateway IPs output per module

output "azure_spoke_gateway_ips_sub1" {
  description = "Map of Azure spoke gateway Public IPs"
  value       = module.azure_spoke_ips_sub1.azure_spoke_gateway_ips
}

output "azure_spoke_gateway_ips_sub2" {
  description = "Map of Azure spoke gateway Public IPs"
  value       = module.azure_spoke_ips_sub2.azure_spoke_gateway_ips
}



output "aws_spoke_gateway_ips" {
  description = "Map of AWS spoke gateway EIP addresses"
  value       = { for key, ip in aws_eip.spoke_gateway_ips : key => ip.public_ip }
}