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

dynamic_keyvault_secrets = {
  sentinel4sapkey = { # Key of the keyvault
    SGH-ABAPOSPASS = {
      secret_name = "SGH-ABAPOSPASS"
      value       = "Very@Str5ngP!44w0rdToChaNge#"
    }
    SGH-ABAPOSUSER = {
      secret_name = "SGH-ABAPOSUSER"
      value       = "Very@Str5ngP!44w0rdToChaNge#"
    }
    SGH-ABAPPASS = {
      secret_name = "SGH-ABAPPASS"
      value       = "Very@Str5ngP!44w0rdToChaNge#"
    }
    SGH-ABAPUSER = {
      secret_name = "SGH-ABAPUSER"
      value       = "Very@Str5ngP!44w0rdToChaNge#"
    }
    SGH-JAVAOSPASS = {
      secret_name = "SGH-JAVAOSPASS"
      value       = "Very@Str5ngP!44w0rdToChaNge#"
    }
    SGH-JAVAOSUSER = {
      secret_name = "SGH-JAVAOSUSER"
      value       = "Very@Str5ngP!44w0rdToChaNge#"
    }
    SGH-LOGWSID = {
      secret_name = "SGH-LOGWSID"
      value       = "MY-WS-ID"
    }
    SGH-LOGWSPUBLICKEY = {
      secret_name = "SGH-LOGWSPUBLICKEY"
      value       = "NY-WS-KEY"
    }
  }
}