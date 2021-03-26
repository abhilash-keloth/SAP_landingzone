vnets = {
  sap_hana = {
    resource_group_key = "sap_hana"
    vnet = {
      name          = "sap-hana-vnet"
      address_space = ["10.12.0.0/16"]
    }
    specialsubnets = {
      gateway = {
        name    = "gateway"
        cidr    = ["10.12.2.0/24"]
        enforce_private_link_endpoint_network_policies = true
        enforce_private_link_service_network_policies  = true
      }
      AzureBastionSubnet = {
        name    = "AzureBastionSubnet"
        cidr    = ["10.12.3.0/27"]
        enforce_private_link_endpoint_network_policies = true
        enforce_private_link_service_network_policies  = true
      }
    }
    subnets = {
      application = {
        name    = "application"
        cidr    = ["10.12.0.0/24"]
        enforce_private_link_endpoint_network_policies = true
        enforce_private_link_service_network_policies  = true
      }
      database = {
        name    = "database"
        cidr    = ["10.12.1.0/24"]
        enforce_private_link_endpoint_network_policies = true
        enforce_private_link_service_network_policies  = true
      }
    }
  }
}
