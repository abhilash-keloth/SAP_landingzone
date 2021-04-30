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

# proximity_placement_groups = {
#   ppg1 = {
#     name               = "ppg-re1"
#     region             = "region1"
#     resource_group_key = "sap_hana"
#   }
# }

availability_sets = {
    app_avset = {
        name = "app_avset_sit1"
        resource_group_key = "sap_hana"
        # proximity_placement_group_key   = "ppg1"
        platform_update_domain_count = 5
        platform_fault_domain_count = 2
    }
    db_avset = {
        name = "db_avset_sit1"
        resource_group_key = "sap_hana"
        platform_update_domain_count = 5
        platform_fault_domain_count = 2
    }
}

virtual_machines = {
  # jbvm1_agent = {
  #   resource_group_key = "sap_hana"
  #   os_type            = "windows"
  #   keyvault_key       = "sentinel4sapkey"
  #   boot_diagnostics_storage_account_key = "s4hana_diag"

  #   # Define the number of networking cards to attach the virtual machine
  #   networking_interfaces = {
  #     nic0 = {
  #       # Value of the keys from networking.tfvars
  #       vnet_key   = "sap_hana"
  #       subnet_key = "application"
  #       # public_address_key = ""
  #       name                    = "jbvm1-nic0"
  #       enable_ip_forwarding    = false
  #       internal_dns_name_label = "jbvm1-nic0"
  #       public_ip_address_key   = "jbvm1_ip"
  #       primary                 = true
  #       nsg_key                 = "jbvm1-nsg"
  #     }
  #   }

  #   #
  #   virtual_machine_settings = {
  #     windows = {
  #       #availability_set_key            = ""
  #       name                            = "jbvm1"
  #       resource_group_key              = "sap_hana"
  #       size                            = "Standard_B2s"
  #       admin_username                  = "demouser"
  #       disable_password_authentication = true

  #       # Value of the nic keys to attach the VM. The first one in the list is the primary nic
  #       network_interface_keys = ["nic0"]

  #       os_disk = {
  #         create_option        = "fromImage"
  #         name                 = "jbvm1-os"
  #         caching              = "ReadWrite"
  #         storage_account_type = "Standard_LRS"
  #         disk_size_gb         = "30"
  #       }

  #       source_image_reference = {
  #         publisher = "MicrosoftWindowsServer"
  #         offer     = "WindowsServer"
  #         sku       = "2012-R2-Datacenter-smalldisk"
  #         version   = "latest"
  #       }

  #     }
  #   }

  #   data_disks = {
  #     jbvm1_bits = {
  #       name                 = "jbvm1_bits"
  #       storage_account_type = "Premium_LRS"
  #       # Only Empty is supported. More community contributions required to cover other scenarios
  #       create_option = "Empty"
  #       disk_size_gb  = "512"
  #       lun           = 0
  #     }
  #   }

  # }

  sit1appvm1 = {
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
        primary                 = true
        nsg_key                 = "ascsvm1-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "app_avset"
        # proximity_placement_group_key   = "ppg1"
        name                            = "sit1_app_vm1"
        resource_group_key              = "sap_hana"
        size                            = "Standard_DS1_v2"  # To be replaced with "Standard_D8ds_v4"
        admin_username                  = "sapuser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "sit-appvm1-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "128" 
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "sles-sap-15-sp1"  
          sku       = "gen2"        
          version   = "latest"
        }

      }
    }

    data_disks = {
      ascsvm1_usrsapexe = {
        name                 = "sitappvm1_usrsap_exe"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "128"  
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }
    }
  }





  sit1appvm2 = {
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
        name                    = "sit1-app2-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "sit1-app2-nic0"
        primary                 = true
        nsg_key                 = "ascsvm1-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "app_avset"
        # proximity_placement_group_key   = "ppg1"
        name                            = "sit1_app_vm2"
        resource_group_key              = "sap_hana"
        size                            = "Standard_DS1_v2"  # To be replaced with "Standard_D8ds_v4"
        admin_username                  = "sapuser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "sit-appvm2-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "128" 
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "sles-sap-15-sp1"  
          sku       = "gen2"        
          version   = "latest"
        }

      }
    }

    data_disks = {
      ascsvm1_usrsapexe = {
        name                 = "sitappvm2_usrsap_exe"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "128"  
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }
    }
  }

######################################### DB ##################################################
  sit1dbvm1 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"
    load_balancer_key  = "db_ilb"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "database"
        # public_address_key = ""
        name                    = "hana-sit1-db1-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "hana-sit1-db1-nic0"
        primary                 = true
        nsg_key                 = "hanavm1-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "db_avset"
        name                            = "sit1_db_vm1"
        resource_group_key              = "sap_hana"
        size                            = "Standard_DS1_v2" #"Standard_M32ls" to whitelist and update
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "hana_sit1_db1-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "128" 
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"   #Not found
          sku       = "15"
          version   = "latest"  
        }

      }
    }

    data_disks = {
      hanavm1_data = {
        name                 = "hana_sit1_db1_data"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "256"  
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }      
      hanavm1_log = {
        name                 = "hana_sit1_db1_log"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "384"  
        lun           = 1
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm1_shared = {
        name                 = "hana_sit1_db1_shared"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512"
        lun           = 2
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm1_backup = {
        name                 = "hana_sit1_db1_backup"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512" 
        lun           = 3
        caching       = "None"
        write_accelerator_enabled = false
      }
      
    }
  }

  sit1dbvm2 = {
    resource_group_key = "sap_hana"
    os_type            = "linux"
    keyvault_key       = "sentinel4sapkey"
    boot_diagnostics_storage_account_key = "s4hana_diag"
    load_balancer_key  = "db_ilb"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key   = "sap_hana"
        subnet_key = "database"
        # public_address_key = ""
        name                    = "hana-sit1-db2-nic0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "hana-sit1-db2-nic0"
        primary                 = true
        nsg_key                 = "hanavm1-nsg"
      }
    }
      #
    virtual_machine_settings = {
      linux = {
        availability_set_key            = "db_avset"
        name                            = "sit1_db_vm2"
        resource_group_key              = "sap_hana"
        size                            = "Standard_DS1_v2" #"Standard_M32ls" to whitelist and update
        admin_username                  = "demouser"
        disable_password_authentication = true

        # Value of the nic keys to attach the VM. The first one in the list is the primary nic
        network_interface_keys = ["nic0"]

        os_disk = {
          create_option        = "fromImage"
          name                 = "hana_sit1_db2-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          disk_size_gb         = "128" 
        }

        source_image_reference = {
          publisher = "SUSE"
          offer     = "SLES-SAP"   #Not found
          sku       = "15"
          version   = "latest"  
        }

      }
    }

    data_disks = {
      hanavm1_data = {
        name                 = "hana_sit1_db2_data"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "256"  
        lun           = 0
        caching       = "None"
        write_accelerator_enabled = false
      }      
      hanavm1_log = {
        name                 = "hana_sit1_db2_log"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "384"  
        lun           = 1
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm1_shared = {
        name                 = "hana_sit1_db2_shared"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512"
        lun           = 2
        caching       = "None"
        write_accelerator_enabled = false
      }
      hanavm1_backup = {
        name                 = "hana_sit1_db2_backup"
        storage_account_type = "Premium_LRS"
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option = "Empty"
        disk_size_gb  = "512" 
        lun           = 3
        caching       = "None"
        write_accelerator_enabled = false
      }
      
    }
  }

}