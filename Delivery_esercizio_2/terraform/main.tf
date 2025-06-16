terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = var.pm_tls_insecure
}

resource "proxmox_vm_qemu" "swarm_nodes" {
  count       = var.vm_count
  name        = "${var.vm_base_name}-${count.index + 1}"
  target_node = var.vm_node
  clone       = var.vm_template
  full_clone  = true

  cores    = var.vm_cores
  memory   = var.vm_memory
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  network {
    model  = "virtio"
    bridge = var.vm_bridge
  }

  disk {
    size    = var.vm_disk_size
    type    = "scsi"
    storage = var.vm_storage
  }

  os_type = "cloud-init"

  ipconfig0  = "ip=dhcp"
  ciuser     = var.ci_user
  cipassword = var.ci_password
  sshkeys    = file(var.ssh_public_key_path)

  lifecycle {
    ignore_changes = [network]
  }
}

output "swarm_vm_names" {
  value = [for vm in proxmox_vm_qemu.swarm_nodes : vm.name]
}

output "swarm_vm_ips" {
  value = [for vm in proxmox_vm_qemu.swarm_nodes : vm.default_ipv4_address]
}
