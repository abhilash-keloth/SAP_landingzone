diagnostic_storage_accounts = {
  # Stores diagnostic logging for region1
  s4hana_diag = {
    name                     = "s4hana_diag89098"
    region                   = "region1"
    resource_group_key       = "sap_hana"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Cool"
  }
}

availability_sets = {
    dia_avset = {
        name = "dia_avset"
        resource_group_key = "sap_hana"
        platform_update_domain_count = 5
        platform_fault_domain_count = 2
    }
    app_avset = {
        name = "app_avset"
        resource_group_key = "sap_hana"
        platform_update_domain_count = 5
        platform_fault_domain_count = 2
    }
    db_avset = {
        name = "db_avset"
        resource_group_key = "sap_hana"
        platform_update_domain_count = 5
        platform_fault_domain_count = 2
    }
    nfs_avset = {
        name = "nfs_avset"
        resource_group_key = "sap_hana"
        platform_update_domain_count = 5
        platform_fault_domain_count = 2
    }
    iscsi_avset = {
        name = "iscsi_avset"
        resource_group_key = "sap_hana"
        platform_update_domain_count = 5
        platform_fault_domain_count = 2
    }
}

virtual_machines = {

  # Configuration to deploy a bastion host linux virtual machine
  sentinel_agent = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "sentinelagent-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "sentinelagent-nic0"
        public_ip_address_key   = "sentinelagent_ip"
        primary                 = true
        nsg_key                 = "sentinelagent-nsg"
      }
    }

    #
    virtual_machine_settings = {
      linux = {
        name                            = "sentinel_agent"
        resource_group_key              = "sap_hana"
        size                            = "Standard_B2s"
        admin_username                  = "sapadm"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "sentinel-os"
          caching              = "ReadWrite"
          storage_account_type = "Premium_LRS"
          disk_size_gb         = 30
        }

        source_image_reference = {
          publisher = "Canonical"
          offer     = "UbuntuServer"
          sku       = "18.04-LTS"
          version   = "latest"
        }

      }
    }

    data_disks = {
    }

  }

  jbvm1_agent = {
    resource_group_key = "sap_hana"
    os_type            = "windows"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "jbvm1-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "jbvm1-nic0"
        public_ip_address_key   = "jbvm1_ip"
        primary                 = true
        nsg_key                 = "jbvm1-nsg"
      }
    }

    #
    virtual_machine_settings = {
      windows = {
        #availability_set_key            = ""
        name                            = "jbvm1"
        resource_group_key              = "sap_hana"
        size                            = "Standard_B2s"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "jbvm1-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "MicrosoftWindowsServer"
          offer     = "WindowsServer"
          sku       = "2012-R2-Datacenter-smalldisk"
          version   = "latest"
        }

      }
    }

    data_disks = {
      jbvm1_bits = {
        name                 = "jbvm1_bits"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512"
        lun           = 0
      }
    }

  }

  ascsvm1_agent = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "ascsvm1-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "ascsvm1-nic0"
        public_ip_address_key   = "ascsvm1_ip"
        primary                 = true
        nsg_key                 = "ascsvm1-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "app_avset"
        name                            = "ascsvm1"
        resource_group_key              = "sap_hana"
        size                            = "Standard_DS12_v2"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "ascsvm1-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      ascsvm1_usrsap = {
        name                 = "ascsvm1_usrsap"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "256"
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }
    }
  }

  ascsvm2_agent = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "ascsvm2-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "ascsvm2-nic0"
        public_ip_address_key   = "ascsvm2_ip"
        primary                 = true
        nsg_key                 = "ascsvm2-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "app_avset"
        name                            = "ascsvm2"
        resource_group_key              = "sap_hana"
        size                            = "Standard_DS12_v2"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "ascsvm2-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      ascsvm2_usrsap = {
        name                 = "ascsvm2_usrsap"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512"
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }
    }
  }

  hanavm1 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "database"
        # public_address_key = ""
        name                    = "hanavm1-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "hanavm1-nic0"
        public_ip_address_key   = "hanavm1_ip"
        primary                 = true
        nsg_key                 = "hanavm1-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "db_avset"
        name                            = "hanavm1"
        resource_group_key              = "sap_hana"
        size                            = "Standard_E16s_v3"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "hanavm1-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      hanavm1_data = {
        name                 = "hanavm1_data"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "1024"
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm1_log = {
        name                 = "hanavm1_log"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512"
        lun           = 1
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm1_shared = {
        name                 = "hanavm1_shared"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512"
        lun           = 2
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm1_backup = {
        name                 = "hanavm1_backup"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "1024"
        lun           = 3
        caching       = "None"
        write_accelerator_enabled = false
      }
    }
  }
  hanavm2 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "database"
        # public_address_key = ""
        name                    = "hanavm2-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "hanavm2-nic0"
        public_ip_address_key   = "hanavm2_ip"
        primary                 = true
        nsg_key                 = "hanavm2-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "db_avset"
        name                            = "hanavm2"
        resource_group_key              = "sap_hana"
        size                            = "Standard_E16s_v3"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "hanavm2-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      hanavm2_data = {
        name                 = "hanavm2_data"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "1024"
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm2_log = {
        name                 = "hanavm2_log"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512"
        lun           = 1
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm2_shared = {
        name                 = "hanavm2_shared"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512"
        lun           = 2
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm2_backup = {
        name                 = "hanavm2_backup"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "1024"
        lun           = 3
        caching       = "None"
        write_accelerator_enabled = false
      }
    }
  }


  iscsivm1 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "iscsivm1-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "iscsivm1-nic0"
        public_ip_address_key   = "iscsivm1_ip"
        primary                 = true
        nsg_key                 = "iscsivm1-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "iscsi_avset"
        name                            = "iscsivm1"
        resource_group_key              = "sap_hana"
        size                            = "Standard_D2s_v3"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "iscsivm1-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      }
  }
  iscsivm2 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "iscsivm2-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "iscsivm2-nic0"
        public_ip_address_key   = "iscsivm2_ip"
        primary                 = true
        nsg_key                 = "iscsivm2-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "iscsi_avset"
        name                            = "iscsivm2"
        resource_group_key              = "sap_hana"
        size                            = "Standard_D2s_v3"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "iscsivm2-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      }
  }
  iscsivm3 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "iscsivm3-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "iscsivm3-nic0"
        public_ip_address_key   = "iscsivm3_ip"
        primary                 = true
        nsg_key                 = "iscsivm3-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "iscsi_avset"
        name                            = "iscsivm3"
        resource_group_key              = "sap_hana"
        size                            = "Standard_D2s_v3"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "iscsivm3-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      }
  }

  nfsvm1 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "nfsvm1-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "nfsvm1-nic0"
        public_ip_address_key   = "nfsvm1_ip"
        primary                 = true
        nsg_key                 = "nfsvm1-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "nfs_avset"
        name                            = "nfsvm1"
        resource_group_key              = "sap_hana"
        size                            = "Standard_DS1_v2"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "nfsvm1-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      nfsvm1_sapmnt = {
        name                 = "nfsvm1_sapmnt"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "256"
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }
    }
  }

  nfsvm2 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "nfsvm2-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "nfsvm2-nic0"
        public_ip_address_key   = "nfsvm2_ip"
        primary                 = true
        nsg_key                 = "nfsvm2-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "nfs_avset"
        name                            = "nfsvm2"
        resource_group_key              = "sap_hana"
        size                            = "Standard_DS1_v2"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "nfsvm2-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      nfsvm2_sapmnt = {
        name                 = "nfsvm2_sapmnt"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "256"
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }
    }
  }

  pasvm1 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"
    availability_set_key = "dia-avset"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "application"
        # public_address_key = ""
        name                    = "pasvm1-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "pasvm1-nic0"
        public_ip_address_key   = "pasvm1_ip"
        primary                 = true
        nsg_key                 = "pasvm1-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "dia_avset"
        name                            = "pasvm1"
        resource_group_key              = "sap_hana"
        size                            = "Standard_DS13-4_v2"
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "pasvm1-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "30"
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"
          sku       = "12-SP3"
          version   = "latest"
        }

      }
    }

    data_disks = {
      pasvm1_usrsap = {
        name                 = "pasvm1_usrsap"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "256"
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }
    }
  }
}