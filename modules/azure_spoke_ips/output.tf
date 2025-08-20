output "azure_spoke_gateway_ips" {
  description = "Map of region-gateway to their Public IPs"
  value = {
    for key, ip in azurerm_public_ip.spoke_gateway_ips :
    key => ip.ip_address
  }
}