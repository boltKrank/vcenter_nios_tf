variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "vcenter_host" {
  type = string
}

variable "datacenter_name" {
  type = string
  default = "Datacenter"
}

variable "datastore_name" {
  type = string
  default = "datastore1"
}

variable "mgmt_network_name" {
  type = string
  default = "MgmtPortGroup"
}

variable "lan1_network_name" {
  type = string
  default = "Lan1PortGroup"
}

variable "resource_pool_name" {
  type = string
  default = "Resources"
}

variable "nios_template_name" {
  type = string
}

variable "nios_vm_name" {
  type = string
  default = "default_nios_vm"
}

