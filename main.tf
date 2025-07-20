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
  }

  /*
    vapp {
    properties = {
      "hostname"   = "vapp-vm"
      "domain"     = "localdomain"
      "ip_address" = "192.168.1.50"
    }
    ovf_environment_transport = ["com.vmware.guestInfo"]
  }

  extra_config = {
    "guestinfo.hostname"   = "vapp-vm"
    "guestinfo.domain"     = "localdomain"
    "guestinfo.ip_address" = "192.168.1.50"
  }

  */

}
