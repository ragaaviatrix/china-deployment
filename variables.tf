variable "azure_transit_regions" {
  type = map(object({
    primary_gw = object({
      name                = string
      resource_group_name = string
      location            = string
    })
    ha_gw = object({
      name                = string
      resource_group_name = string
      location            = string
    })
  }))
}

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