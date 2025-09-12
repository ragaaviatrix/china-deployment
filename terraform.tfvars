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
  "cn_north_1" = {
    primary_gw = {
      region = "cn-north-1"
      tags = {
        Name = "cn-north-1-trgw"
      }
    }
    ha_gw = {
      region = "cn-north-1"
      tags = {
        Name = "cn-north-1-ha-trgw"
      }
    }
  }
  "cn_northwest_1" = {
    primary_gw = {
      region = "cn-northwest-1"
      tags = {
        Name = "cn-northwest-1-trgw"
      }
    }
    ha_gw = {
      region = "cn-northwest-1"
      tags = {
        Name = "cn-northwest-1-ha-trgw"
      }
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
  "cn_north_1" = {
    "gw1" = {
      region = "cn-north-1"
      tags = {
        Name = "cn-north-1-gw1"
      }
    }
    "gw2" = {
      region = "cn-north-1"
      tags = {
        Name = "cn-north-1-gw2"
      }
    }
  }
  "cn_northwest_1" = {
    "gw1" = {
      region = "cn-northwest-1"
      tags = {
        Name = "cn-northwest-1-gw1"
      }
    }
    "gw2" = {
      region = "cn-northwest-1"
      tags = {
        Name = "cn-northwest-1-gw2"
      }
    }
  }
}

aws_spoke_regions_acc2 = {
  "cn_north_1" = {
    "gw2" = {
      region = "cn-north-1"
      tags = {
        Name = "cn-north-1-gw2"
      }
    }
  }
  "cn_northwest_1" = {
    "gw2" = {
      region = "cn-northwest-1"
      tags = {
        Name = "cn-northwest-1-gw2"
      }
    }
  }
}



controller_nsg_name            = "china-controller-security-group"
controller_resource_group_name = "management-rg"
copilot_nsg_name               = "china-copilot-security-group"

