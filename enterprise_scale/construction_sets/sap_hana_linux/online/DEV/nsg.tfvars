network_security_group_definition = {
  ascsvm1-nsg = {
    version = 1
    resource_group_key             = "sap_hana"
    name                           = "ascsdevvm1"
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
    ]
  }
 } 