# Deploy Kubernetes using Terraform and Ansible in VSPHERE/VMWARE

This project deploy a full set of VMs on VMWare hosts using terraform provider. Then set a Kubernetes high available cluster by Ansible playbook.

## Terraform

Variables defined in `variables.tf`.
VMs hardware config values in `terraform.tfvars`.
Using `vsphere` provider.
OS: Ubuntu-20.04, previously created by packer.

> terraform init
> terraform plan -var 'vsphere-user=xxxxxx' -var 'vsphere-password=xxxxxx' -out tf.plan
> terraform apply -var 'vsphere-user=xxxxxx' -var 'vsphere-password=xxxxxx'

## Ansible

Run Ansible.

> ansible-playbook -i ansible/hosts ansible/main.yml

VMs addresses:

10.10.3.14 cluster1k8lb cluster1k8lb.domain.local
10.10.3.15 cluster1k8m1 cluster1k8m1.domain.local
10.10.3.16 cluster1k8m2 cluster1k8m2.domain.local
10.10.3.17 cluster1k8m3 cluster1k8m3.domain.local
192.168.0.85 cluster1k8w1 cluster1k8w1.domain.local
192.168.0.86 cluster1k8w2 cluster1k8w2.domain.local
192.168.0.87 cluster1k8w3 cluster1k8w3.domain.local
192.168.0.89 cluster1k8w4 cluster1k8w4.domain.local
192.168.0.90 cluster1k8w5 cluster1k8w5.domain.local
192.168.0.91 cluster1k8w6 cluster1k8w6.domain.local
192.168.0.94 cluster1k8w7 cluster1k8w7.domain.local
192.168.0.95 cluster1k8w8 cluster1k8w8.domain.local

Firewall ports open between VMs:

TCP 2379,2380,6443,6781,6782,6783,6784,8090,8091,10250,10251,10252,10255
UDP 6783,6784
