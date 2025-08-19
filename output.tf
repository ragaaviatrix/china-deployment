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

output "azure_spoke_gateway_ips" {
  description = "Map of region-gateway to their Public IPs"
  value = {
    for key, ip in azurerm_public_ip.spoke_gateway_ips :
    key => ip.ip_address
  }
}

output "aws_spoke_gateway_ips" {
  description = "Map of AWS spoke gateway EIP addresses"
  value       = { for key, ip in aws_eip.spoke_gateway_ips : key => ip.public_ip }
}