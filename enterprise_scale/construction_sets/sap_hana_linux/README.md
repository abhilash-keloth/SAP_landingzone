# Reference architecture
https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/sap/sap-s4hana

NSG: https://azure.microsoft.com/en-us/blog/sap-on-azure-architecture-designing-for-security/
https://help.sap.com/viewer/ports

# Deployment

```bash
# Script to execute from bash shell

# Login to your Azure Subscription
az login

# Make sure you are using the right subscription
az account show -o table

# Go to the AKS construction set folder 
cd caf-terraform-landingzones-starter/enterprise_scale/construction_sets/sap_hana_linux

configuration_folder=online/configuration

# Define the configuration files to apply
parameter_files=("\
  -var-file=${configuration_folder}/global_settings.tfvars \
  -var-file=${configuration_folder}/resource_groups.tfvars \
  -var-file=${configuration_folder}/networking.tfvars \
  -var-file=${configuration_folder}/nsg.tfvars \
  -var-file=${configuration_folder}/keyvault.tfvars \
  -var-file=${configuration_folder}/compute.tfvars 
")
  # -var-file=${configuration_folder}/firewalls.tfvars \
  # -var-file=${configuration_folder}/firewall_application_rule_collection_definition.tfvars \
  # -var-file=${configuration_folder}/firewall_network_rule_collection_definition.tfvars \
  # -var-file=${configuration_folder}/public_ips.tfvars \
  # -var-file=${configuration_folder}/keyvaults.tfvars \
  # -var-file=${configuration_folder}/iam_aad.tfvars \
  # -var-file=${configuration_folder}/iam_role_mappings.tfvars \
  # -var-file=${configuration_folder}/aks.tfvars \
  # -var-file=${configuration_folder}/route_tables.tfvars \
  # -var-file=${configuration_folder}/diagnostics.tfvars \
  # -var-file=${configuration_folder}/certificate_requests.tfvars \
  # -var-file=${configuration_folder}/keyvaults.tfvars \
  # -var-file=${configuration_folder}/iam_managed_identities.tfvars \
  # -var-file=${configuration_folder}/private_dns.tfvars \
  # -var-file=${configuration_folder}/domain.tfvars \
  # -var-file=${configuration_folder}/agw.tfvars \
  # -var-file=${configuration_folder}/agw_application.tfvars \
  # ")

# OPTIONAL: -var-file=${configuration_folder}/bastion.tfvars \

export TF_VAR_logged_user_objectId=$(az ad signed-in-user show --query objectId -o tsv)

# Load the CAF module and related providers
terraform init -upgrade

# Create the plan
eval terraform plan -out="online-sap.tfplan" ${parameter_files}

# Trigger the deployment of the resources
terraform apply "online-sap.tfplan"

# (When needed) Destroy the resources
eval terraform destroy ${parameter_files}

# or if you are facing destroy issues
eval terraform destroy \
  ${parameter_files} \
  -refresh=false

```