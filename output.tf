output "transit_gateway_ips" {
  value = {
    for key, ip in azurerm_public_ip.transit_gateway_ips :
    key => ip.ip_address
  }
}