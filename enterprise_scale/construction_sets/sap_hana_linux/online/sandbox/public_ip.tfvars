public_ip_addresses = {
  jbvm1_ip = {
    name               = "jbvm1_ip"
    resource_group_key = "sap_hana"
    sku                = "Basic"
    allocation_method = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }

}