output "aws_spoke_gateway_ips" {
  description = "Map of AWS spoke gateway EIP addresses"
  value       = { for key, ip in aws_eip.spoke_gateway_ips : key => ip.public_ip }
}