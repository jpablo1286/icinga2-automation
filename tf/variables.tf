variable "provider_instances" {
  type = map(any)
  description = "select how many instance to deploy"
  default = {
      pve = {
          dev = ["mysql","icinga"]
          prod = []
      }
      aws = {
          dev = []
          prod = ["mysql","icinga"]
      }
  }
}
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
variable "ssh_key" {
    type = string
    default = "key.pem"
}
variable "ssh_key_pub" {
    type = string
    default = "key.pem.pub"
}
variable "ips" {
  type = map(any)
}
variable "gw" {
  type = map(any)
}
variable "mask" {
  type = map(any)
}
variable "playbook" {
  type = map(any)
}
variable "dns" {
  type = string
}
variable "ssh_user" {
  type = string
}