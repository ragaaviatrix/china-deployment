variable "azure_spoke_regions" {
  type = map(map(object({
    name                = string
    resource_group_name = string
    location            = string
  })))
}



