resource "random_string" "pve_random" {
  count   = length(var.provider_instances["pve"][terraform.workspace])
  length  = 4
  special = false
  upper   = false
}

resource "random_string" "aws_random" {
  count   = length(var.provider_instances["aws"][terraform.workspace])
  length  = 4
  special = false
  upper   = false
}
module "pve-instance" {
    source = "./pve-instance"
    count = length(var.provider_instances["pve"][terraform.workspace])
    pve_url = var.pve_url
    pve_user = var.pve_user
    pve_password = var.pve_password
    ssh_key = var.ssh_key
    ssh_key_pub = var.ssh_key_pub
    template = local.deployment[terraform.workspace][var.provider_instances["pve"][terraform.workspace][count.index]]["image"]
    vm_name = "${var.provider_instances["pve"][terraform.workspace][count.index]}-${random_string.pve_random[count.index].result}"
    ip = local.deployment[terraform.workspace][var.provider_instances["pve"][terraform.workspace][count.index]]["ip"][0]
    mask = local.deployment[terraform.workspace][var.provider_instances["pve"][terraform.workspace][count.index]]["mask"][0]
    gw = local.deployment[terraform.workspace][var.provider_instances["pve"][terraform.workspace][count.index]]["gw"][0]
    dns = var.dns
    vmid = 200 + count.index
    ssh_user = var.ssh_user
    playbook = local.deployment[terraform.workspace][var.provider_instances["pve"][terraform.workspace][count.index]]["playbook"]
}