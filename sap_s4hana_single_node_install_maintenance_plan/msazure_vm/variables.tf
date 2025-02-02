
variable "az_tenant_id" {
  description = "Azure Tenant ID"
}

variable "az_subscription_id" {
  description = "Azure Subscription ID"
}

variable "az_app_client_id" {
  description = "Azure AD App Client ID"
}

variable "az_app_client_secret" {
  description = "Azure AD App Client Secret"
}

variable "resource_prefix" {
  description = "Prefix to resources"
}

variable "az_resource_group_name" {
  description = "Azure Resource Group Name, enter existing/target Resource Group name or enter 'new' to create a Resource Group"
}

variable "az_region" {
  description = "Azure Region aka. Azure Location Display Name (e.g. 'West Europe')"
}

variable "az_vnet_name" {
  description = "Azure VNet name (cannot be 'new' if using existing VNet Subnet)"
}

variable "az_vnet_subnet_name" {
  description = "Azure VNet Subnet name (if using existing VNet, ensure default subnet range matches to VNet address space and does not conflict with existing Subnet)"
}

variable "dns_root_domain" {
  description = "Root Domain for Private DNS used with the Virtual Server"
}

variable "bastion_os_image" {
  description = "Bastion OS Image. This variable uses the locals mapping with regex of OS Images, and will alter bastion provisioning."
}

variable "bastion_user" {
  description = "OS User to create on Bastion host to avoid pass-through root user (e.g. bastionuser)"
}

variable "bastion_ssh_port" {
  type        = number
  description = "Bastion host SSH Port from IANA Dynamic Ports range (49152 to 65535)"

  #validation {
  #  condition     = var.bastion_ssh_port > 49152 && var.bastion_ssh_port < 65535
  #  error_message = "Bastion host SSH Port must fall within IANA Dynamic Ports range (49152 to 65535)."
  #}
}

variable "host_specification_plan" {
  description = "Host specification plans are small_256gb, small_256gb_ha. This variable uses the locals mapping with a nested list of host specifications, and will alter host provisioning."
}

variable "host_os_image" {
  description = "Host OS Image. This variable uses the locals mapping with regex of OS Images, and will alter host provisioning."
}

variable "disk_volume_capacity_software" {
  type        = number
  description = "Disk volume capacity for downloads of SAP Software"
}

variable "sap_software_download_directory" {
  description = "Mount point for downloads of SAP Software"

  validation {
    error_message = "Directory must start with forward slash."
    condition = can(regex("^/", var.sap_software_download_directory))
  }

}


variable "sap_id_user" {
  description = "Ansible - Please enter your SAP ID user (e.g. S-User)"
}

variable "sap_id_user_password" {
  description = "Ansible - Please enter your SAP ID password"
}

variable "sap_hana_install_master_password" {
  description = "Ansible - SAP HANA install: set common initial password (e.g. NewPass$321)"
}

variable "sap_hana_install_sid" {
  description = "Ansible - SAP HANA install: System ID (e.g. H01)"
}

variable "sap_hana_install_instance_number" {
  description = "Ansible - SAP HANA install: Instance Number (e.g. 10)"

  validation {
    error_message = "Cannot use Instance Number 43 (HA port number) or 89 (Windows Remote Desktop Services)."
    condition = !can(regex("(43|89)", var.sap_hana_install_instance_number))
  }

}

variable "sap_s4hana_install_sid" {
  description = "Ansible - SAP S/4HANA install: System ID (e.g. S01)"
}

variable "sap_maintenance_planner_transaction_name" {
  description = "Ansible - SAP Maintenance Planner Transaction name for SAP S/4HANA, required to perform download of this stack"
}

variable "sap_swpm_template_selected" {
  description = "Ansible - Select template to use: sap_s4hana_2020_onehost_install, sap_s4hana_2021_onehost_install, sap_s4hana_2022_onehost_install"
}

variable "sap_nwas_ascs_instance_no" {
  description = "Ansible - SAP NetWeaver AS (ABAP) - ABAP Central Services (ASCS) instance number"

  validation {
    error_message = "Cannot use Instance Number 43 (HA port number) or 89 (Windows Remote Desktop Services)."
    condition = !can(regex("(43|89)", var.sap_nwas_ascs_instance_no))
  }

}

variable "sap_nwas_pas_instance_no" {
  description = "Ansible - SAP NetWeaver AS (ABAP) - Primary Application Server instance number"

  validation {
    error_message = "Cannot use Instance Number 43 (HA port number) or 89 (Windows Remote Desktop Services)."
    condition = !can(regex("(43|89)", var.sap_nwas_pas_instance_no))
  }

}
