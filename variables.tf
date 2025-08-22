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

variable "aws_transit_regions" {
  type = map(object({
    primary_gw = object({
      region = string
    })
    ha_gw = object({
      region = string
    })
  }))
}

variable "azure_spoke_regions_sub1" {
  type = map(map(object({
    name                = string
    resource_group_name = string
    location            = string
    subscription_id     = string
  })))
}

variable "azure_spoke_regions_sub2" {
  type = map(map(object({
    name                = string
    resource_group_name = string
    location            = string
    subscription_id     = string
  })))

}

variable "aws_spoke_regions_acc1" {
  type = map(map(object({
    region = string
    tags   = map(string)
  })))
}

variable "aws_spoke_regions_acc2" {
  type = map(map(object({
    region = string
    tags   = map(string)
  })))
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

variable "aws_use1_access_key" {
  type        = string
  description = "AWS access key for us-east-1 region."
}

variable "aws_use1_secret_key" {
  type        = string
  description = "AWS secret key for us-east-1 region."
}

variable "aws_apse1_access_key" {
  type        = string
  description = "AWS access key for us-west-2 region."
}

variable "aws_apse1_secret_key" {
  type        = string
  description = "AWS secret key for us-west-2 region."
}