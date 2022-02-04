# =================== #
# Deploying VMware VM #
# =================== #
# Connect to VMware vSphere vCenter
provider "vsphere" {
  user = var.vsphere-user
  password = var.vsphere-password
  vsphere_server = var.vsphere-vcenter

  # If you have a self-signed cert
  allow_unverified_ssl = var.vsphere-unverified-ssl
}

# Define VMware vSphere
data "vsphere_datacenter" "dc" {
  name = var.vsphere-datacenter
}

data "vsphere_datastore" "datastore1" {
  name = var.vm-datastore1
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore2" {
  name = var.vm-datastore2
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore3" {
  name = var.vm-datastore3
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name = var.vsphere-cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network1" {
  name = var.vm-network1
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network2" {
  name = var.vm-network2
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/${var.vm-template-name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}






# Create VMs

#Creating Loadbalance
resource "vsphere_virtual_machine" "lb" {
  count = "${length(var.load)}"
  name = "${lookup(var.load[count.index], "vm-name")}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore1.id
  num_cpus = "${lookup(var.load[count.index], "vm-cpu")}"
  memory = "${lookup(var.load[count.index], "vm-ram")}"
  guest_id = "${lookup(var.load[count.index], "vm-guest-id")}"

extra_config = {
  "disk.EnableUUID" = "TRUE"
}

network_interface {
  network_id = data.vsphere_network.network1.id
}

disk {
  label = "${lookup(var.load[count.index], "vm-name")}-disk"
  thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  size  = "${lookup(var.load[count.index], "vm-disksize")}"
}

wait_for_guest_ip_timeout = -1

clone {
  template_uuid = data.vsphere_virtual_machine.template.id
  customize {
    timeout = 0
    
    linux_options {
      #host_name = "node-${var.vm-name}"
      host_name = "${lookup(var.load[count.index], "vm-hostname")}"
      domain = "${var.vm-domain}"
      time_zone = "America/Campo_Grande"
    }
    
    network_interface {
        ipv4_address = "${lookup(var.load[count.index], "vm-ipaddress")}"
        ipv4_netmask = "24"
        #ipv6_address = "${lookup(var.load[count.index], "vm-ipv6address")}"
        #ipv6_netmask = "64"
      }

    ipv4_gateway = "${lookup(var.load[count.index], "vm-ipgw")}"
    #ipv6_gateway = "${lookup(var.load[count.index], "vm-ipv6gw")}"
    dns_server_list = ["8.8.8.8","8.8.4.4"]
    dns_suffix_list = ["${var.vm-domain}"]
  }
 }
}



#Creating Masters
resource "vsphere_virtual_machine" "master" {
  count = "${length(var.kmaster)}"
  name = "${lookup(var.kmaster[count.index], "vm-name")}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore1.id
  num_cpus = "${lookup(var.kmaster[count.index], "vm-cpu")}"
  memory = "${lookup(var.kmaster[count.index], "vm-ram")}"
  guest_id = "${lookup(var.kmaster[count.index], "vm-guest-id")}"

extra_config = {
  "disk.EnableUUID" = "TRUE"
}

network_interface {
  network_id = data.vsphere_network.network1.id
}

disk {
  label = "${lookup(var.kmaster[count.index], "vm-name")}-disk"
  thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  size  = "${lookup(var.kmaster[count.index], "vm-disksize")}"
}

wait_for_guest_ip_timeout = -1

clone {
  template_uuid = data.vsphere_virtual_machine.template.id
  customize {
    timeout = 0
    
    linux_options {
      #host_name = "node-${var.vm-name}"
      host_name = "${lookup(var.kmaster[count.index], "vm-hostname")}"
      domain = "${var.vm-domain}"
      time_zone = "America/Campo_Grande" #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< set your timezone
    }
    
    network_interface {
        ipv4_address = "${lookup(var.kmaster[count.index], "vm-ipaddress")}"
        ipv4_netmask = "24"
        #ipv6_address = "${lookup(var.kmaster[count.index], "vm-ipv6address")}"
        #ipv6_netmask = "64"
      }

    ipv4_gateway = "${lookup(var.kmaster[count.index], "vm-ipgw")}"
    #ipv6_gateway = "${lookup(var.kmaster[count.index], "vm-ipv6gw")}"
    dns_server_list = ["8.8.8.8","8.8.4.4"]
    dns_suffix_list = ["${var.vm-domain}"]
  }
 }
}




#Creating Workers group-datastore 1
resource "vsphere_virtual_machine" "worker1" {
  count = "${length(var.kworker1)}"
  name = "${lookup(var.kworker1[count.index], "vm-name")}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore2.id
  num_cpus = "${lookup(var.kworker1[count.index], "vm-cpu")}"
  memory = "${lookup(var.kworker1[count.index], "vm-ram")}"
  guest_id = "${lookup(var.kworker1[count.index], "vm-guest-id")}"

extra_config = {
  "disk.EnableUUID" = "TRUE"
}

network_interface {
  network_id = data.vsphere_network.network2.id
}

disk {
  label = "${lookup(var.kworker1[count.index], "vm-name")}-disk"
  thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  size  = "${lookup(var.kworker1[count.index], "vm-disksize")}"
}

wait_for_guest_ip_timeout = -1

clone {
  template_uuid = data.vsphere_virtual_machine.template.id
  customize {
    timeout = 0
    
    linux_options {
      #host_name = "node-${var.vm-name}"
      host_name = "${lookup(var.kworker1[count.index], "vm-hostname")}"
      domain = "${var.vm-domain}"
      time_zone = "America/Campo_Grande" #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< set your timezone
    }
    
    network_interface {
        ipv4_address = "${lookup(var.kworker1[count.index], "vm-ipaddress")}"
        ipv4_netmask = "24"
        ipv6_address = "${lookup(var.kworker1[count.index], "vm-ipv6address")}"
        ipv6_netmask = "64"
      }

    ipv4_gateway = "${lookup(var.kworker1[count.index], "vm-ipgw")}"
    ipv6_gateway = "${lookup(var.kworker1[count.index], "vm-ipv6gw")}"
    dns_server_list = ["8.8.8.8","8.8.4.4","2001:4860:4860::8888","2001:4860:4860::8844"]
    dns_suffix_list = ["${var.vm-domain}"]
  }
 }
}

#Creating Workers group-datastore 2
resource "vsphere_virtual_machine" "worker2" {
  count = "${length(var.kworker2)}"
  name = "${lookup(var.kworker2[count.index], "vm-name")}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore3.id
  num_cpus = "${lookup(var.kworker2[count.index], "vm-cpu")}"
  memory = "${lookup(var.kworker2[count.index], "vm-ram")}"
  guest_id = "${lookup(var.kworker2[count.index], "vm-guest-id")}"

network_interface {
  network_id = data.vsphere_network.network2.id
}

disk {
  label = "${lookup(var.kworker2[count.index], "vm-name")}-disk"
  thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  size  = "${lookup(var.kworker2[count.index], "vm-disksize")}"
}

wait_for_guest_ip_timeout = -1

clone {
  template_uuid = data.vsphere_virtual_machine.template.id
  customize {
    timeout = 0
    
    linux_options {
      #host_name = "node-${var.vm-name}"
      host_name = "${lookup(var.kworker2[count.index], "vm-hostname")}"
      domain = "${var.vm-domain}"
      time_zone = "America/Campo_Grande" #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< set your timezone
    }
    
    network_interface {
        ipv4_address = "${lookup(var.kworker2[count.index], "vm-ipaddress")}"
        ipv4_netmask = "24"
        ipv6_address = "${lookup(var.kworker2[count.index], "vm-ipv6address")}"
        ipv6_netmask = "64"
      }

    ipv4_gateway = "${lookup(var.kworker2[count.index], "vm-ipgw")}"
    ipv6_gateway = "${lookup(var.kworker2[count.index], "vm-ipv6gw")}"
    dns_server_list = ["8.8.8.8","8.8.4.4","2001:4860:4860::8888","2001:4860:4860::8844"]
    dns_suffix_list = ["${var.vm-domain}"]
  }
 }
}




output "lb_ip_address" {
  value = vsphere_virtual_machine.lb.*.guest_ip_addresses
}
output "masters_ip_address" {
  value = vsphere_virtual_machine.master.*.guest_ip_addresses 
}
output "workers1_ip_address" {
  value = vsphere_virtual_machine.worker1.*.guest_ip_addresses 
}
output "workers2_ip_address" {
  value = vsphere_virtual_machine.worker2.*.guest_ip_addresses 
}