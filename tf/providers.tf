terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}
provider "proxmox" {
    pm_api_url = var.pve_url
    pm_user = var.pve_user
    pm_password = var.pve_password
    pm_tls_insecure = true
}