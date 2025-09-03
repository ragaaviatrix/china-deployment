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



# module "aws_spoke_gateway" {
#   source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
#   version = "2.6.0"

#   cloud           = "aws"
#   region          = "cn-north-1" # Replace with actual region
#   cidr            = "10.188.4.0/23"
#   account         = "skf-aws"
#   name = "skf-aws-transit-vpc"
#   gw_name         = "aws-china-transit-gateway"
#   instance_size   = "c6in.large"
#   local_as_number = "64566"
#   allocate_new_eip = false
#   eip =    "43.196.65.53"
#   ha_eip = "44.212.232.57"

# }