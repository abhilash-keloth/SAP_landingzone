network_security_group_definition = {

  ascsvm1-nsg = {
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
        description                = "sapdp00  enq/serverhost"
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
        description                = "hana studio connection"
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
        description                = "backup montior via Azure"
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
        description                = "hana studio connection"
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
        description                = "connection - vm2"
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
        description                = "hdb connection"
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
    nsg = [
      {
        name                       = "SSH"
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
        name                       = "Port_3210"
        description                = "message server port connection via sap gui"
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
        name                       = "Port_30013"
        description                = "hanadb-ilb:30013i"
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
        name                       = "Port_30015"
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
        name                       = "Port_3310"
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

   app = {

    nsg = [
      {
        name                       = "app-inbound-http",
        priority                   = "103"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "VirtualNetwork"
      },
      {
        name                       = "app-inbound-https",
        priority                   = "104"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "VirtualNetwork"
      },
      {
        name                       = "ssh-from-jump-host",
        priority                   = "105"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.1.3.0/24"
        destination_address_prefix = "VirtualNetwork"
      },
    ]
  }

  sap-nfs = {

    nsg = [
      {
        name                       = "app-inbound",
        priority                   = "103"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_ranges    = ["30015-31015 ", "3615"]
        source_address_prefix      = "10.1.4.0/24"
        destination_address_prefix = "VirtualNetwork"
      },
      {
        name                       = "ssh-from-jump-host",
        priority                   = "104"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.1.3.0/24"
        destination_address_prefix = "VirtualNetwork"
      },
    ]
  }
}
