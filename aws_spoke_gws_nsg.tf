module "aws_spoke_ips_acc1" {
  source = "./modules/aws_spoke_ips"

  aws_spoke_regions              = var.aws_spoke_regions_acc1

  providers = {
    aws = aws.aws_cnn1
  }

}

module "aws_spoke_ips_acc2" {
  source = "./modules/aws_spoke_ips"

  aws_spoke_regions              = var.aws_spoke_regions_acc2

  providers = {
    aws = aws.aws_cnnw1
  }
}

module "update_aws_spoke_ips_nsg" {
  source = "./modules/update_aws_spoke_gws_nsg"

  all_aws_spoke_gateway_ips_list = flatten([
    module.aws_spoke_ips_acc1.aws_spoke_ips_for_nsg_update,
    module.aws_spoke_ips_acc2.aws_spoke_ips_for_nsg_update
  ])

  controller_nsg_name            = var.controller_nsg_name
  controller_resource_group_name = var.controller_resource_group_name
  copilot_nsg_name               = var.copilot_nsg_name
  
  providers = {
    azurerm = azurerm.controllersub
  }
  
}


# module "spoke_aws_1" {
#   source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
#   version = "8.0.0"

#   cloud            = "AWS"
#   name             = "rananth-skf-gw"
#   region           = "cn-north-1"
#   account          = "aws-skf-china"
#   attached = false
#   use_existing_vpc = true
#   vpc_id           = "vpc-0fd37ad26d31549e3"
#   gw_subnet        = "10.220.0.0/28"
#   hagw_subnet      = "10.220.0.16/28"
#   eip =    "54.223.186.77"
#   ha_eip = "54.222.157.254"
#   # single_ip_snat   = true
#   allocate_new_eip = false
# }

