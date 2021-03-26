vnets = {
  sap_hana = {
    resource_group_key = "sap_hana"
    vnet = {
      name          = "sap-hana-vnet"
      address_space = ["10.1.0.0/16"]
    }
    specialsubnets = {}
    subnets = {
      jump-host = {
        name    = "jump_host"
        cidr    = ["10.1.3.0/24"]
        nsg_key = "jump_host"
      }
      sap-app = {
        name    = "sap-app"
        cidr    = ["10.1.4.0/24"]
        nsg_key = "sap-app"
      }
      sap-hana = {
        name    = "hana"
        cidr    = ["10.1.5.0/24"]
        nsg_key = "sap-hana"
      }
      sap-nfs = {
        name    = "nsf"
        cidr    = ["10.1.6.0/24"]
      }
    }
  }
}
