variable "pve_url" {
    type = string
    default = "https://localhost"  
}
variable "pve_user" {
    type = string
    default = "root@pam"  
}
variable "pve_password" {
    type = string
    default = "none"
}
variable "lxc_password" {
    type = string
    default = "none"
}
variable "ssh_user" {}
variable "ssh_key" {
    type = string
    default = "key.pem"
}
variable "ssh_key_pub" {
    type = string
    default = "key.pem.pub"
}
variable "template" {
    type = string
    default = "myimage"
}
variable "vm_name" {
    type = string
}
variable "vmid" {}
variable "ip" {}
variable "gw" {}
variable "mask" {}
variable "dns" {}
variable "playbook" {}