resource "aws_eip" "spoke_gateway_ips" {
  for_each = local.aws_spoke_gateway_ips
  region   = each.value.region
  tags     = each.value.tags

}
