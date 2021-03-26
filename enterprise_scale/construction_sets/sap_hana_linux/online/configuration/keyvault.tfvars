keyvaults = {
  sentinel4sapkey = {
    name               = "sentinel4sapkey"
    resource_group_key = "sap_hana"
    sku_name           = "standard"

    enabled_for_deployment = true

    creation_policies = {
      logged_in_user = {
        key_permissions = [ "Get", "List","Update", "Create","Import","Delete","Recover","Backup","Restore"]
        secret_permissions = [ "Get", "List","Set","Delete","Recover", "Backup","Restore"]
        certificate_permissions = [ "Get","List","Update","Create","Import","Delete","Recover","Backup","Restore","ManageContacts","ManageIssuers","GetIssuers","ListIssuers", "SetIssuers","DeleteIssuers"]
      }
    }
  }
}