# Provisioning

This repository contains Terraform code for deploying the Phallama Pod on Azure SGX enabled machines.

The code provisions resources such as Virtual Machines and a Virtual network. The infrastructure is designed to support the deployment of a Phallama Pod.

## Prerequisites

Before running this Terraform code, make sure you have the following prerequisites set up:

- Terraform: Install Terraform on your local machine. You can download it from the official website: [Terraform Downloads](https://developer.hashicorp.com/terraform/downloads).

- Azure CLI: Create an account on [Azure](https://portal.azure.com//). You will need an Account for authentication and more data

- Azure Storage: Create a new storage [new storage](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.Storage%2FStorageAccounts). Set up your storage with the following specifications: Resource Group Name = phallama, Storage Account Name = ${choose a unique name here}, and create a new container named phallama-terraform-container. You must also add your storage_account_name to the `versions.tf` file before deploying.

- Intel IAS API key and SPID. (You can get it from [here](https://api.portal.trustedservices.intel.com/EPID-attestation))

## Usage

Follow the steps below to use this Terraform code:

- Clone the repository: Clone this repository to your local machine.

- Set up Terraform variables: Create a file named .tfvars in the root directory as the Terraform code. Copy the contents of `.tfvars.example` and add values for each variable.


- Initialize Terraform: Open a terminal or command prompt, navigate to the cloned repository directory, and run the following command to initialize Terraform:

```bash
yarn provisioner start
```

- Review the execution plan: Run the following command to see the execution plan and ensure that everything looks correct:

```bash
yarn provisioner plan
```
Verify that the planned changes match your expectations.

- Apply the Terraform configuration: Once you're ready to provision the infrastructure, run the following command:

```bash
yarn provisioner apply
```

- Wait for the deployment: Terraform will start provisioning the resources on Azure. Wait for the process to complete.

- Access the deployed infrastructure: After the deployment is successful, you can access the deployed resources, such as the Virtual Machines, using SSH/user+password. Make sure to use the appropriate SSH key and the IP addresses of the created Virtual Machines.

- Cleanup and destroy: To clean up and destroy the created infrastructure, run the following command:

```bash
yarn provisioner destroy
```

## How to access BAZK App
After the deployment is successful, you can acess your virtual machine with ssh:

```bash
ssh {YOUR_MACHINE_USARNAME_DEFAULT_=_adminuser}@{YOUR_MACHINE_IP}
```

If necessary, enter the machine password.

## Additional Information

- The Terraform code uses the Azure provider, which is defined in the *required_providers* block in the *terraform* configuration section.

- The SSH key paths, Azure Tenant Id and Subscription Id are defined as variables in the *variable* blocks. You can customize these values in the *variables.tf* file or by using command-line flags when executing Terraform commands.

- The code provisions a Azure SSH key named *bazk-ssh* using the public key located at the path specified in the *pub_key* variable. Make sure the file exists and contains the correct public key.

- The Virtual Machine is provisioned using the vm size Standard_DC2s_v2 with Linux kernel v5.13 and SGX enabled. Adjust the image, region, size, and other configurations in the *resource "azurerm_virtual_machine" "bazk"* blocks to fit your requirements.

