output "transit_gateway_ips" {
  value = {
    for key, ip in azurerm_public_ip.transit_gateway_ips :
    key => ip.ip_address
  }
}

output "aws_transit_gateway_ip_list" {
  description = "Map of AWS Transit Gateway EIP addresses"
  value       = { for key, ip in aws_eip.transit_gateway_ips : key => ip.public_ip }
}
