# Azure Architectures recreated with Terraform

## Run a Linux VM on Azure

[![Architecture of a Linux VM accessible only via Azure Bastion](img/linux-vm-single-vm-diagram.svg "Linux VM on Azure Architecture")](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/n-tier/linux-vm)

### Architecture Description

The Linux VM has no public IP address and can only be accessed via Azure Bastion. The bastion host is attached to a public IP address and can be used as a jump box to SSH into the VM. The NAT Gateway allows the VM to connect outbound to the internet while remaining in a fully private subnet. 

### Lessons Learned

- Azure Bastion subnet must be `/26` or larger