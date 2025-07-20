resource "vsphere_virtual_machine" "nios_vm" {
  name = var.nios_vm_name
  resource_pool_id = data.vsphere_resource_pool.default.id
  datastore_id = data.vsphere_datastore.datastore.id

  num_cpus = data.vsphere_virtual_machine.template.num_cpus
  memory = data.vsphere_virtual_machine.template.memory
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  guest_id = "otherGuest64"

  wait_for_guest_ip_timeout = 0

  wait_for_guest_net_timeout = 0

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

  extra_config = {
    "guestinfo.userdata" = base64encode(<<EOF
#infoblox-config 
remote_console_enabled: y
default_admin_password: Infoblox@312
temp_license: enterprise dns dhcp cloud nios IB-V825
EOF
    )
  }



}
