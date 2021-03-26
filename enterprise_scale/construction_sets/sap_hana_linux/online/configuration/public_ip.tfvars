public_ip_addresses = {
  ascsvm1_ip = {
    name               = "ascsvm1_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  ascsvm2_ip = {
    name               = "ascsvm2_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  hanavm1_ip = {
    name               = "hanavm1_ip"
    resource_group_key = "sap_hana"
    sku                = "Standard"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  hanavm2_ip = {
    name               = "hanavm2_ip"
    resource_group_key = "sap_hana"
    sku                = "Standard"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  iscsivm1_ip = {
    name               = "iscsivm1_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  iscsivm2_ip = {
    name               = "iscsivm2_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  iscsivm3_ip = {
    name               = "iscsivm3_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  jbvm1_ip = {
    name               = "jbvm1_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  nfsvm1_ip = {
    name               = "nfsvm1_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  nfsvm2_ip = {
    name               = "nfsvm2_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  pasvm1_ip = {
    name               = "pasvm1_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  s4hana_demo_vnet_ip = {
    name               = "s4hana_demo_vnet_ip"
    resource_group_key = "sap_hana"
    sku                = "Standard"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
  sentinelagent_ip = {
    name               = "sentinelagent_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
}