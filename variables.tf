#===========================#
# VMware vCenter connection #
#===========================#
variable "vsphere-user" {
type = string
description = "VMware vSphere user name"
}
variable "vsphere-password" {
type = string
description = "VMware vSphere password"
}
variable "vsphere-vcenter" {
type = string
description = "VMWare vCenter server FQDN / IP"
}
variable "vsphere-unverified-ssl" {
type = string
description = "Is the VMware vCenter using a self signed certificate (true/false)"
}
variable "vsphere-datacenter" {
type = string
description = "VMWare vSphere datacenter"
}
variable "vsphere-cluster" {
type = string
description = "VMWare vSphere cluster"
default = ""
}
variable "vsphere-template-folder" {
type = string
description = "Template folder"
default = "Templates"
}
#================================#
# VMware vSphere virtual machine #
#================================#

variable "load"{
type = list
default = []
}
variable "kmaster"{
type = list
default = []
}
variable "kworker1"{
type = list
default = []
}
variable "kworker2"{
type = list
default = []
}
variable "vm-datastore1" {
type = string
description = "Datastore used for the vSphere virtual machines"
}
variable "vm-datastore2" {
type = string
description = "Datastore used for the vSphere virtual machines"
}
variable "vm-datastore3" {
type = string
description = "Datastore used for the vSphere virtual machines"
}
variable "vm-network1" {
type = string
description = "Vlan Network used for the vSphere virtual machines"
}
variable "vm-network2" {
type = string
description = "Vlan Network used for the vSphere virtual machines"
}
variable "vm-template-name" {
type = string
description = "The template to clone to create the VM"
}
variable "vm-domain" {
type = string
description = "Linux virtual machine domain name for the machine. This, along with host_name, make up the FQDN of the virtual machine"
default = "domain.local"
}