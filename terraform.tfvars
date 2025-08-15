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

aws_transit_regions = {
  "us_east_1" = {
    primary_gw = {
      region = "us-east-1"
    }
    ha_gw = {
      region = "us-east-1"
    }
  }
  "ap_southeast_1" = {
    primary_gw = {
      region = "ap-southeast-1"
    }
    ha_gw = {
      region = "ap-southeast-1"
    }
  }
}

controller_nsg_name = "skf-china-controller-security-group"
controller_resource_group_name = "skf-management-rg"
copilot_nsg_name = "skf-china-copilot-security-group"
