terraform {
  required_providers {
    vsphere = {
        source = "vmware/vsphere"
        version = "~>2.14"
    }
  }
}

provider "vsphere" {
    user = var.admin_username
    password = var.admin_password
    vsphere_server = var.vcenter_host
    allow_unverified_ssl = true
}