shared_services = {
    recovery_vaults = {
    s4hanabackupvault = {
        name               = "s4hanabackupvautt1234"
        resource_group_key = "sap_hana"

        region = "region1"

        replication_policies = {
        repl1 = {
            name               = "sap_policy"
            resource_group_key = "primary"

            recovery_point_retention_in_minutes                  = 24 * 60
            application_consistent_snapshot_frequency_in_minutes = 4 * 60
        }
        }


        backup_policies = {
        vms = {
            policy1 = {
            name      = "VMBackupPolicy1"
            vault_key = "asr1"
            rg_key    = "primary"
            timezone  = "UTC"
            backup = {
                frequency = "Daily"
                time      = "23:00"
                #if not desired daily, can pick weekdays as below:
                #weekdays  = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            }
            retention_daily = {
                count = 10
            }
            retention_weekly = {
                count    = 42
                weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
            }
            retention_monthly = {
                count    = 7
                weekdays = ["Sunday", "Wednesday"]
                weeks    = ["First", "Last"]
            }
            retention_yearly = {
                count    = 77
                weekdays = ["Sunday"]
                weeks    = ["Last"]
                months   = ["January"]
            }
            }
        }

        fs = {
            policy1 = {
            name      = "FSBackupPolicy1"
            vault_key = "asr1"
            rg_key    = "primary"
            timezone  = "UTC"
            backup = {
                frequency = "Daily"
                time      = "23:00"
            }
            retention_daily = {
                count = 10
            }
            }
        }
        }
    }
    }
}