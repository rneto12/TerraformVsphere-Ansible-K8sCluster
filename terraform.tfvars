# VMware VMs configuration #

vm-template-name = "Ubuntu-20.04"
load = [
    {
        vm-name = "Cluster1-K8sLB"
        vm-hostname = "cluster1k8lb"
        vm-network1 = "vmwareVLAN100"
        vm-ipaddress = "10.30.3.244"
        vm-ipgw = "10.30.3.1"
        vm-ipv6address = ""
        vm-ipv6gw = ""
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "2"
        vm-ram = "2048"
        vm-disksize = "25"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    }
]
kmaster = [
    {
        vm-name = "Cluster1-K8sM1"
        vm-hostname = "cluster1k8m1"
        vm-network1 = "vmwareVLAN100"
        vm-ipaddress = "10.30.3.245"
        vm-ipgw = "10.30.3.1"
        vm-ipv6address = ""
        vm-ipv6gw = ""
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "4"
        vm-ram = "6144"
        vm-disksize = "150"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    },
    {
        vm-name = "Cluster1-K8sM2"
        vm-hostname = "cluster1k8m2"
        vm-network1 = "vmwareVLAN100"
        vm-ipaddress = "10.30.3.246"
        vm-ipgw = "10.30.3.1"
        vm-ipv6address = ""
        vm-ipv6gw = ""
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "4"
        vm-ram = "6144"
        vm-disksize = "150"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    },
    {
        vm-name = "Cluster1-K8sM3"
        vm-hostname = "cluster1k8m3"
        vm-network1 = "vmwareVLAN100"
        vm-ipaddress = "10.30.3.247"
        vm-ipgw = "10.30.3.1"
        vm-ipv6address = ""
        vm-ipv6gw = ""
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "4"
        vm-ram = "6144"
        vm-disksize = "150"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    }

]



kworker1 = [
    {
        vm-name = "Cluster1-K8sW1"
        vm-hostname = "cluster1k8w1"
        vm-network2 = "vmwareVLAN200"
        vm-ipaddress = "192.168.0.85"
        vm-ipgw = "192.168.0.1"
        vm-ipv6address = "ipv6:85"
        vm-ipv6gw = "ipv6:1"
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "8"
        vm-ram = "16384"
        vm-disksize = "1024"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    },
    {
        vm-name = "Cluster1-K8sW2"
        vm-hostname = "cluster1k8w2"
        vm-network2 = "vmwareVLAN200"
        vm-ipaddress = "192.168.0.86"
        vm-ipgw = "192.168.0.1"
        vm-ipv6address = "ipv6:86"
        vm-ipv6gw = "ipv6:1"
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "8"
        vm-ram = "16384"
        vm-disksize = "1024"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    },
    {
        vm-name = "Cluster1-K8sW3"
        vm-hostname = "cluster1k8w3"
        vm-network2 = "vmwareVLAN200"
        vm-ipaddress = "192.168.0.87"
        vm-ipgw = "192.168.0.1"
        vm-ipv6address = "ipv6:87"
        vm-ipv6gw = "ipv6:1"
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "8"
        vm-ram = "16384"
        vm-disksize = "1024"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    }
]
kworker2 = [
    {
        vm-name = "Cluster1-K8sW4"
        vm-hostname = "cluster1k8w4"
        vm-network2 = "vmwareVLAN200"
        vm-ipaddress = "192.168.0.89"
        vm-ipgw = "192.168.0.1"
        vm-ipv6address = "ipv6:89"
        vm-ipv6gw = "ipv6:1"
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "8"
        vm-ram = "16384"
        vm-disksize = "1024"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    },
    {
        vm-name = "Cluster1-K8sW5"
        vm-hostname = "cluster1k8w5"
        vm-network2 = "vmwareVLAN200"
        vm-ipaddress = "192.168.0.90"
        vm-ipgw = "192.168.0.1"
        vm-ipv6address = "ipv6:90"
        vm-ipv6gw = "ipv6:1"
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "8"
        vm-ram = "16384"
        vm-disksize = "1024"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    },
    {
        vm-name = "Cluster1-K8sW6"
        vm-hostname = "cluster1k8w6"
        vm-network2 = "vmwareVLAN200"
        vm-ipaddress = "192.168.0.91"
        vm-ipgw = "192.168.0.1"
        vm-ipv6address = "ipv6:91"
        vm-ipv6gw = "ipv6:1"
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "8"
        vm-ram = "16384"
        vm-disksize = "1024"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    },
    {
        vm-name = "Cluster1-K8sW7"
        vm-hostname = "cluster1k8w7"
        vm-network2 = "vmwareVLAN200"
        vm-ipaddress = "192.168.0.94"
        vm-ipgw = "192.168.0.1"
        vm-ipv6address = "ipv6:94"
        vm-ipv6gw = "ipv6:1"
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "8"
        vm-ram = "16384"
        vm-disksize = "1024"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    },
    {
        vm-name = "Cluster1-K8sW8"
        vm-hostname = "cluster1k8w8"
        vm-network2 = "vmwareVLAN200"
        vm-ipaddress = "192.168.0.95"
        vm-ipgw = "192.168.0.1"
        vm-ipv6address = "ipv6:95"
        vm-ipv6gw = "ipv6:1"
        #vm-template-name = "Debian-10.9"
        vm-template-name = "Ubuntu-20.04"
        vm-cpu = "8"
        vm-ram = "16384"
        vm-disksize = "1024"
        #vm-guest-id = "other3xLinux64Guest"
        vm-guest-id = "ubuntu64Guest"
    }

]
# VMware vSphere configuration #
# VMware vCenter IP/FQDN
vsphere-vcenter = "vcsa.domain.local"
# VMware vSphere username used to deploy the infrastructure
vsphere-user = ""
# VMware vSphere password used to deploy the infrastructure
vsphere-password = ""
# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"
# vSphere datacenter name where the infrastructure will be deployed 
vsphere-datacenter = "Datacenter1"
# vSphere cluster name where the infrastructure will be deployed
vsphere-cluster = "ClusterVMWARE"
# vSphere Datastore used to deploy VMs 
vm-datastore1 = "VV_R5_FC_1"
vm-datastore2 = "VV_R5_FC_2"
vm-datastore3 = "VV_R5_FC_3"
# vSphere Network used to deploy VMs 
vm-network1 = "vmwareVLAN100"
vm-network2 = "vmwareVLAN200"
# Linux virtual machine domain name
vm-domain = "domain.local"
