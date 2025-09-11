variable "controller_nsg_name" {
  type        = string
  description = "Name of the Network Security Group for the controller."
}

variable "controller_resource_group_name" {
  type        = string
  description = "Resource Group Name for the controller."
}

variable "copilot_nsg_name" {
  type        = string
  description = "Name of the Network Security Group for the CoPilot."
}


variable "all_azure_spoke_gateway_ips_list" {
  type        = list(string)
  description = "List of all Azure Spoke Gateway IPs."
}

variable "tcp443_priority" {
  type        = number
  description = "Priority for TCP 443 rule."
}

variable "udp5000_priority" {
  type        = number
  description = "Priority for UDP 5000 rule."
}

variable "udp31283_priority" {
  type        = number
  description = "Priority for UDP 31283 rule."
}

variable "sub_id" {
  type        = string
  description = "Account ID for AWS resources."
}