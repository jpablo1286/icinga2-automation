locals {
  deployment = {
    dev = {  
        mysql = {
            instance_count = 1
            image           = "centos-7-cloud-init"
            port            = 1880
            ip              = var.ips["mysql"][terraform.workspace]
            gw              = var.gw["mysql"][terraform.workspace]
            mask            = var.mask["mysql"][terraform.workspace]
            playbook        = var.playbook["mysql"][terraform.workspace]
        }
        icinga = {
            instance_count = 1
            image           = "centos-7-cloud-init"
            port            = 1880
            ip              = var.ips["icinga"][terraform.workspace]
            gw              = var.gw["icinga"][terraform.workspace]
            mask            = var.mask["icinga"][terraform.workspace]
            playbook        = var.playbook["icinga"][terraform.workspace]
        }
    }
    prod = {  
        mysql = {
            instance_count = 1
            image           = "my-image"
            port            = 1880
            ip              = var.ips["mysql"][terraform.workspace]
            gw              = var.gw["mysql"][terraform.workspace]
            mask            = var.mask["mysql"][terraform.workspace]
            playbook        = var.playbook["mysql"][terraform.workspace]
        }
        icinga = {
            instance_count = 1
            image           = "my-image"
            port            = 1880
            ip              = var.ips["icinga"][terraform.workspace]
            gw              = var.gw["icinga"][terraform.workspace]
            mask            = var.mask["icinga"][terraform.workspace]
            playbook        = var.playbook["icinga"][terraform.workspace]
        }
    }

  }
}