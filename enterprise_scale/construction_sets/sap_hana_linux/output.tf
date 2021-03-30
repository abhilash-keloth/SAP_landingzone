output "managed_identities" {
  value = module.caf.managed_identities
}

output "keyvaults" {
  value = module.caf.keyvaults
}

output "domain_name_registrations" {
  value = module.caf.domain_name_registrations
}

output "vnets" {
  value = module.caf.vnets
}

output "storage_accounts" {
  value = module.caf.storage_accounts
}
output "virtual_machines" {
  value = module.caf.virtual_machines
}
output "public_ip_addresses" {
  value = module.caf.public_ip_addresses
}
