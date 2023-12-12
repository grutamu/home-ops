resource "proxmox_vm_qemu" "k3s" {
    count = 6
    name = "k3s-0${count.index + 1}"
    os_type = "cloud-init"
    target_node = "prd-pve-03"
    clone = "ubuntu-template"
    agent = 1
    cores = 4
    sockets = 1
    memory = 4096
    scsihw = "virtio-scsi-pci"
    bios = "ovmf"
    disk {
        size = "20G"
        type = "scsi"
        storage = "truenas-ssd"
        ssd = 1
        discard = "on"
        backup = true
    }
    network {
        model = "virtio"
        bridge = "vmbr0"
    }
    lifecycle {
        ignore_changes = [
            network, target_node, qemu_os
        ]
    }
    ipconfig0 = "ip=192.168.99.7${count.index + 1}/24,gw=192.168.99.1"
    ciuser = var.ciuser
    sshkeys = <<EOF
    ${var.ssh_key}
    EOF
}

