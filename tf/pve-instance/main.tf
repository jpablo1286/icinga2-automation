resource "proxmox_vm_qemu" "base-vm" {
  count = 1
  name = var.vm_name
  vmid = var.vmid
  full_clone = true
  clone = var.template
  target_node = "pve"
  cores = 2
  sockets = 1
  vcpus = 2
  memory = 1024
  balloon = 1024
  boot =  "c"
  bootdisk = "virtio0"
  ciuser = var.ssh_user
  sshkeys = file(var.ssh_key_pub)
  scsihw = "virtio-scsi-pci"

  onboot = false
  agent =  1
  cpu = "kvm64"
  numa = true
  hotplug = "network,disk,cpu,memory"
  nameserver = var.dns
  
  network {
    bridge = "vmbr0"
    model = "virtio"
  }
  
  ipconfig0 = "ip=${var.ip}/${var.mask},gw=${var.gw}"
  
  disk {
    #id = 0
    type = "virtio"
    storage = "CTs"
    size = "8G"
  }

  os_type = "cloud-init"
  
  #creates ssh connection to check when the CT is ready for ansible provisioning
  connection {
    host = var.ip
    user = var.ssh_user
    private_key = file(var.ssh_key)
    agent = false
    timeout = "3m"
  }

  provisioner "remote-exec" {
	  # Leave this here so we know when to start with Ansible local-exec 
    inline = [ "echo 'Cool, we are ready for provisioning'"]
  }

  provisioner "local-exec" {
    working_dir = "../ansible/"
    command = "export ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook -u ${var.ssh_user} --key-file ../tf/${var.ssh_key} --extra-vars 'hostname=${var.vm_name}' -i inventory.txt ${var.playbook}"
  }
}