# variable "access_account_name" {
#   type        = string
#   description = "aviatrix controller access account name"
# }

# variable "account_email" {
#   type        = string
#   description = "aviatrix controller access account email"
# }



variable "controller_name" {
  type        = string
  description = "Customized Name for Aviatrix Controller"
  default     = "skf-china-controller"
}

# variable "controller_subnet_cidr" {
#   type        = string
#   description = "CIDR for controller subnet."
#   default     = "10.0.0.0/24"
# }

# variable "controller_version" {
#   type        = string
#   description = "Aviatrix Controller version"
#   default     = "latest"
# }

variable "controller_virtual_machine_admin_username" {
  type        = string
  description = "Admin Username for the controller virtual machine."
  default     = "chinaadmin"
}

variable "controller_virtual_machine_admin_password" {
  type        = string
  description = "Admin Password for the controller virtual machine."
  default     = "Aviatrix123#"
}

variable "controller_virtual_machine_size" {
  type        = string
  description = "Virtual Machine size for the controller."
  default     = "Standard_D4s_v5"
}

# variable "controller_vnet_cidr" {
#   type        = string
#   description = "CIDR for controller VNET."
#   default     = "10.0.0.0/24"
# }

variable "incoming_ssl_cidr" {
  type        = list(string)
  description = "Incoming cidr for security group used by controller"
  default     = ["0.0.0.0/0"]
}

# variable "location" {
#   type        = string
#   description = "Resource Group Location for Aviatrix Controller"
#   default     = "West US"
# }

variable "use_existing_vnet" {
  type        = bool
  description = "Flag to indicate whether to use an existing VNET"
  default     = true
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name, only required when use_existing_vnet is true"
  default     = "skf-management-rg"
}

variable "vnet_name" {
  type        = string
  description = "VNET name, only required when use_existing_vnet is true"
  default     = "skf-mgmt-vnet"
}

variable "subnet_name" {
  type        = string
  description = "subnet name, only required when use_existing_vnet is true"
  default     = "controller"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID, only required when use_existing_vnet is true"
  default     = "/subscriptions/8f14a30e-9ebf-483a-9e96-c02eca2bd0a6/resourceGroups/skf-management-rg/providers/Microsoft.Network/virtualNetworks/skf-mgmt-vnet/subnets/controller"
}

variable "copilot_name" {
  type        = string
  description = "Customized Name for Aviatrix CoPilot"
  default     = "skf-china-copilot"
}

variable "copilot_virtual_machine_admin_username" {
  type        = string
  description = "Admin Username for the copilot virtual machine."
  default     = "chinaadmin"
}

variable "copilot_virtual_machine_admin_password" {
  type        = string
  description = "Admin Password for the copilot virtual machine."
  default     = "Aviatrix123#"
}

variable "copilot_allowed_cidrs" {
  type        = set(string)
  description = "Incoming cidr for copilot"
  default     = ["0.0.0.0/0"]
}

variable "copilot_virtual_machine_size" {
  type    = string
  default = "Standard_D4s_v5"
}
