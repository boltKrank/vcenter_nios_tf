resource "vsphere_virtual_machine" "nios_vm" {
  name = var.nios_vm_name
  resource_pool_id = data.vsphere_resource_pool.default.id
  datastore_id = data.vsphere_datastore.datastore.id

  num_cpus = data.vsphere_virtual_machine.template.num_cpus
  memory = data.vsphere_virtual_machine.template.memory
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  guest_id = "otherGuest64"

  network_interface {
    network_id = data.vsphere_network.mgmt_network.id
    adapter_type = "vmxnet3"
  }

  network_interface {
    network_id = data.vsphere_network.lan1_network.id
    adapter_type = "vmxnet3"

  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      
      network_interface {
        ipv4_address = "192.168.68.80"
        ipv6_netmask = 24
      }

      ipv4_gateway = "192.168.68.1"

    }



  }

}
