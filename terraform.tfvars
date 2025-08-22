azure_transit_regions = {
  "China_North_3" = {
    "primary_gw" = {
      name                = "chn3primarygwip"
      resource_group_name = "transit-rg-chn3"
      location            = "China North 3"
    }
    "ha_gw" = {
      name                = "chn3hagwip"
      resource_group_name = "transit-rg-chn3"
      location            = "China North 3"
    }
  }
  "China_East_2" = {
    "primary_gw" = {
      name                = "che2primarygwip"
      resource_group_name = "transit-rg-che2"
      location            = "China East 2"
    }
    "ha_gw" = {
      name                = "che2hagwip"
      resource_group_name = "transit-rg-che2"
      location            = "China East 2"
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


azure_spoke_regions_sub1 = {
  "China_North_3" = {
    "gw1" = {
      name                = "chn3spoke1gwip"
      resource_group_name = "spoke-rg-chn3"
      location            = "China North 3"
      subscription_id     = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
    }
    "gw2" = {
      name                = "chn3spoke2gwip"
      resource_group_name = "spoke-rg-chn3"
      location            = "China North 3"
      subscription_id     = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
    }
  }
  "China_East_2" = {
    "gw1" = {
      name                = "che2spoke1gwip"
      resource_group_name = "spoke-rg-che2"
      location            = "China East 2"
      subscription_id     = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
    }
  }
}

azure_spoke_regions_sub2 = {
  "China_East_2" = {
    "gw2" = {
      name                = "che2spoke2gwip"
      resource_group_name = "spoke-rg-che2"
      location            = "China East 2"
      subscription_id     = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
    }
    "gw3" = {
      name                = "che2spoke3gwip"
      resource_group_name = "spoke-rg-che2"
      location            = "China East 2"
      subscription_id     = "8f14a30e-9ebf-483a-9e96-c02eca2bd0a6"
    }
  }
}

aws_spoke_regions_acc1 = {
  "us_east_1" = {
    "gw1" = {
      region = "us-east-1"
      tags = {
        Name        = "us-east-1-gw1"
      }
    }
    "gw2" = {
      region = "us-east-1"
      tags = {
        Name        = "us-east-1-gw2"
      }
    }
  }
  "ap_southeast_1" = {
    "gw1" = {
      region = "ap-southeast-1"
      tags = {
        Name        = "ap-southeast-1-gw1"
      }
    }
    # "gw2" = {
    #   region = "ap-southeast-1"
    # }
  }
}

aws_spoke_regions_acc2 = {
  "us_east_1" = {
    "gw2" = {
      region = "us-east-1"
      tags = {
        Name        = "us-east-1-gw2"
      }
    }
  }
  "ap_southeast_1" = {
    "gw2" = {
      region = "ap-southeast-1"
      tags = {
        Name        = "ap-southeast-1-gw2"
      }
    }
  }
}


controller_nsg_name            = "skf-china-controller-security-group"
controller_resource_group_name = "skf-management-rg"
copilot_nsg_name               = "skf-china-copilot-security-group"

