output "azure_spoke_gateway_ips" {
  description = "Map of region-gateway to their Public IPs"
  value = {
    for key, ip in azurerm_public_ip.spoke_gateway_ips :
    key => ip.ip_address
  }
}

output "azure_spoke_ips_for_nsg_update" {
  value = local.all_azure_spoke_gateway_ips_list
}