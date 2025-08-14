azure_transit_regions = {
  "China_North_3" = {
    "primary_gw" = {
      name                = "chn3primarygwip"
      resource_group_name = "transit-rg-chn3"
      location = "China North 3"
    }
    "ha_gw" = {
      name                = "chn3hagwip"
      resource_group_name = "transit-rg-chn3"
      location = "China North 3"
    }
  }
    "China_East_2" = {
        "primary_gw" = {
        name                = "che2primarygwip"
        resource_group_name = "transit-rg-che2"
        location = "China East 2"
        }
        "ha_gw" = {
        name                = "che2hagwip"
        resource_group_name = "transit-rg-che2"
        location = "China East 2"
        }
    }
}

controller_nsg_name = "skf-china-controller-security-group"
controller_resource_group_name = "skf-management-rg"
copilot_nsg_name = "skf-china-copilot-security-group"
