variable "vm_name" {
  description = "Machine Name"
}
variable "vpc_id_fse" {
  description = "VPC ID"
}
variable "se_subnet_id" {
  description = "Subnet ID"
}
variable "ami-image" {
  description = "Image to use"
}
variable "image-size" {
  description = "Image size"
}
variable "public_ip" {
  description = "If you want a Public IP"
}
variable "shutdown_rules" {
  description = "Add noshut if you want to keep it up"
}
variable "department_name" {
  description = "Department Name"
}
variable "myregion" {
  description = "Region"
}
variable "remo_sg_name" {
  description = "Name of the Sec Groups"
}
variable "remo_sg_name_two" {
  description = "Name of the Sec Groups second"
}
variable "profile" {
  description = "Profile to use "
}
variable "owner" {
  description = "owner"
}
variable "ssh_key" {
  description = "your ssh key to use"
}
variable "vm_count" {
  description = "number of VM you want to have"
}

