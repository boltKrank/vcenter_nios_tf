data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "mgmt_network" {
  name          = var.mgmt_network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "lan1_network" {
    name = var.lan1_network_name
    datacenter_id = data.vsphere_datacenter.dc.id  
}

data "vsphere_resource_pool" "default" {
  name          = var.resource_pool_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name = var.nios_template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}