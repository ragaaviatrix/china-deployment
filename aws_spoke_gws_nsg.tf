module "aws_spoke_ips_acc1" {
  source = "./modules/aws_spoke_ips"

  aws_spoke_regions              = var.aws_spoke_regions_acc1
  controller_nsg_name            = var.controller_nsg_name
  controller_resource_group_name = var.controller_resource_group_name
  copilot_nsg_name               = var.copilot_nsg_name
  # Use unique priorities for each module to avoid conflicts
  tcp443_priority   = 1110   # increment by 1 for each module
  udp5000_priority  = 2110   # increment by 1 for each module
  udp31283_priority = 3110   # increment by 1 for each module
  acc_id            = "acc1" # name it as you like

  providers = {
    aws = aws.aws_cnn1
  }
}

module "aws_spoke_ips_acc2" {
  source = "./modules/aws_spoke_ips"

  aws_spoke_regions              = var.aws_spoke_regions_acc2
  controller_nsg_name            = var.controller_nsg_name
  controller_resource_group_name = var.controller_resource_group_name
  copilot_nsg_name               = var.copilot_nsg_name
  # Use unique priorities for each module to avoid conflicts
  tcp443_priority   = 1111   # increment by 1 for each module
  udp5000_priority  = 2111   # increment by 1 for each module
  udp31283_priority = 3111   # increment by 1 for each module
  acc_id            = "acc2" # name it as you like

  providers = {
    aws = aws.aws_cnnw1
  }
}


# module "spoke_aws_1" {
#   source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
#   version = "8.0.0"

#   cloud            = "AWS"
#   name             = "rananth-skf-vpc"
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

