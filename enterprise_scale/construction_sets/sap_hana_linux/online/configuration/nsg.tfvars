network_security_group_definition = {
  ascsvm1-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "ascsvm1"
    nsg = [
      {
        name                       = "ssh",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_3200",
        priority                   = "1020"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "3200"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }

  ascsvm2-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "ascsvm2"
    nsg = [
      {
        name                       = "ssh",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_9100",
        priority                   = "1020"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "9100"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_3200",
        priority                   = "1030"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "3200"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }

  hanavm1-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "hanavm1"
    nsg = [
      {
        name                       = "ssh",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_30015",
        priority                   = "1020"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "9100"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_30013",
        priority                   = "1030"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "30013"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }

  hanavm2-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "hanavm2"
    nsg = [
      {
        name                       = "ssh",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_30015",
        priority                   = "1020"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "9100"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_30003",
        priority                   = "1030"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "30003"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_30013",
        priority                   = "1040"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "30013"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_30102",
        priority                   = "1050"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "30102"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }

  iscsivm1-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "iscsivm1"
    nsg = [
      {
        name                       = "ssh",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }

  iscsivm2-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "iscsivm2"
    nsg = [
      {
        name                       = "ssh",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }

  iscsivm3-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "iscsivm3"
    nsg = [
      {
        name                       = "ssh",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }

  jbvm1-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "jbvm1"
    nsg = [
      {
        name                       = "RDP",
        priority                   = "300"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_22_winscp",
        priority                   = "310"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }
  
  nfsvm1-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "nfsvm1"
    nsg = [
      {
        name                       = "SSH",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }
  
  nfsvm2-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "nfsvm2"
    nsg = [
      {
        name                       = "SSH",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }

  pasvm1-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "pasvm1-nsg "
    nsg = [
      {
        name                       = "SSH",
        priority                   = "1010"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_3210",
        priority                   = "1020"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "3210"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_30013",
        priority                   = "1030"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "30013"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_30015",
        priority                   = "1040"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "30015"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Port_3310",
        priority                   = "1050"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "3310"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }

  sentinelagent-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "sentinelagent-nsg "
    nsg = [
      {
        name                       = "SSH",
        priority                   = "300"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "TCP"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
    ]
  }
 } 