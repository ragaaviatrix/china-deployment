module "aviatrix_controller_build" {
  source = "./modules/aviatrix_controller_build"
  // please do not use special characters such as `\/"[]:|<>+=;,?*@&~!#$%^()_{}'` in the controller_name
  controller_name                           = var.controller_name
  controller_virtual_machine_admin_username = var.controller_virtual_machine_admin_username
  controller_virtual_machine_admin_password = var.controller_virtual_machine_admin_password
  controller_virtual_machine_size           = var.controller_virtual_machine_size
  incoming_ssl_cidr                         = var.incoming_ssl_cidr
  use_existing_vnet                         = var.use_existing_vnet
  resource_group_name                       = var.resource_group_name
  vnet_name                                 = var.vnet_name
  subnet_name                               = var.subnet_name
  subnet_id                                 = var.subnet_id

}

module "copilot_build_azure" {
  source                         = "./modules/copilot_build_azure"
  copilot_name                   = var.copilot_name
  virtual_machine_admin_username = var.copilot_virtual_machine_admin_username
  virtual_machine_admin_password = var.copilot_virtual_machine_admin_password
  controller_private_ip          = module.aviatrix_controller_build.aviatrix_controller_private_ip_address
  controller_public_ip           = module.aviatrix_controller_build.aviatrix_controller_public_ip_address
  use_existing_vnet              = true
  virtual_machine_size           = var.copilot_virtual_machine_size
  subnet_cidr                    = module.aviatrix_controller_build.aviatrix_controller_vnet.subnets[0]
  subnet_id                      = var.subnet_id
  vnet_cidr                      = module.aviatrix_controller_build.aviatrix_controller_vnet.address_space[0]
  location                       = module.aviatrix_controller_build.aviatrix_controller_vnet.location
  resource_group_name            = module.aviatrix_controller_build.aviatrix_controller_vnet.resource_group_name

  allowed_cidrs = {
    "tcp_cidrs" = {
      priority = "100"
      protocol = "Tcp"
      ports    = ["443"]
      cidrs    = var.copilot_allowed_cidrs #["<< CIDR_1 >>", "<< CIDR_2 >>", ...]
    }
  }

  additional_disks = {
    "one" = {
      managed_disk_id = module.copilot_build_azure.disk_id
      lun             = 1
    }
  }

  depends_on = [module.aviatrix_controller_build]
}