# L101-LI-03 Providers

**Note: All the L101-LI-[*] labs are part of a sequence and build upon each other.**

## Create a new Terraform file

Create a new folder.

Create a new file and name it **main.tf**

## Find the Linode provider settings

Head to https://registry.terraform.io

Locate the Linode provider and click on the **Use Provider** button.

Copy the code and paste it in the main.tf file.

## Edit the code

Replace this line

    # Configuration options

With this

    token = "[your token]"

Save the file

## Create an API token

In the Linode console, click on your account icon located in the top right corner of the screen and then click on the **API Tokens** link.

Click on the **Create a Personal Access Token** button.

Enter a label and enable **Read/Write** for all services.

Scroll down and click on the **Create Token** button.

Copy the token and paste in the the **token.txt** file.

In the **main.tf** file, replace the [your token] placeholder with your Linode token.

Save the file.

## Init the folder

    terraform init

You should see some new files and folders being created in the working folder.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-LI-05 Validate/Format

**Note: All the L101-LI-[*] labs are part of a sequence and build upon each other.**

## Let's try the fmt command

Change the position of these two lines a little bit so that they are no longer aligned. Note that the version number can differ, that's OK. Save the file.

    source = "linode/linode"
    version = "1.26.3"

Run the fmt command

    terraform fmt

The lines should be aligned correctly now.

## Let's validate

Run the validate command

    terraform validate

All is good.  Let's change this line

    source  = "linode/linode"

to this by changing the source parameter to **sources**. Save the file.

    sources  = "linode/linode"

Run validate again

    terraform validate

There's an error now.  Remove the extra character and save the file.

## Create a Linode

Add the following code to create a Linode.

resource "linode_instance" "lab" {
    label = "k8sacademy"
    image = "linode/ubuntu21.04"
    region = "ca-central"
    type = "g6-nanode-1"
    root_pass = "terr4form-test"
}

You can replace the image, region an type values to your liking.

List the images slugs

    linode-cli images list

List the regions slugs

    linode-cli regions list

List the Linode sizes slugs

    linode-cli linodes types

Run the validate command

    terraform validate

All is good.  Comment out this mandatory parameter using the # sign. Save the file.

    # region = "ca-central"

Run the validate command

    terraform validate

There's an error!  Replace the name parameter, save the file and validate again.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-LI-07 Plan

**Note: All the L101-LI-[*] labs are part of a sequence and build upon each other.**

## Let's create a plan

Run the plan command

    terraform plan

Save a plan by typing

    terraform plan -out=myplan

The plan has been saved to the **myplan** file.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-LI-09 Apply

**Note: All the L101-LI-[*] labs are part of a sequence and build upon each other.**

## Let's create the project

    terraform apply

Head to the portal and validate that the linode was created or check using the CLI

    linode-cli linodes list

Let's make a change by changing the label property.

    label_name = "k8slab2"

Format and validate

    terraform fmt
    terraform validate

Check what will Terraform do

    terraform plan

The resource will be updated, not replaced. Good! Let's deploy the change.

    terraform apply

Check that the change was correctly applied

    linode-cli linodes list

List the objects in the Terraform state

    terraform state list

There's only one and it's the project.  Copy it's name and show it.

    terraform state show [name]

Inspect the state file by clicking on the terraform.state file.

Let's try to change the root password value. Edit the **terraform.tfvars** file and change the value.

    root_password = "terr4form-test2"

Check what will Terraform do

    terraform plan

This time, the change is destructive because you can't change the root password value.

Let's see what will happen

    terraform apply

Let's now delete the project by typing

    terraform destroy

Let's check

    linode-cli linodes list

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-LI-11 Variables

**Note: All the L101-LI-[*] labs are part of a sequence and build upon each other.**

## Let's now use variables

Edit the main.tf file by creating a local variable for the project name.

    locals {
        label_name = "k8slab2"
    }

Now get the name from the variable

    label = local.label_name

## Create 2 new files: **variables.tf** and **terraform.tfvars**

Edit the **variables.tf** file to declare 2 variables. Note that project_name does not have a default value.

    variable "root_pass" {
      type = string
      description = "The Linode root password"
    }
    
    variable "linode_region" {
      type = string
      default = "ca-central"
      description = "The data center location"
    }

## Edit the **terraform.tfvars** file 

Add these values

    root_password = "terr4form-test"
    linode_region = "us-east"

## Edit the **main.tf** file 

Use the newly created variables

    resource "linode_instance" "lab" {
        label = local.label_name
        image = "linode/ubuntu21.04"
        region = var.linode_region
        type = "g6-nanode-1"
        root_pass = var.root_password
    }

## Let's validate, plan and deploy

The plan outpout should display the values we used as variables

    terraform validate
    terraform plan

Deploy

    terraform apply

Let's check

    linode-cli linodes list

Let's now delete the project by typing

    terraform destroy

Let's check

    linode-cli linodes list

Let's try to override the description on the command line. The plan should display that value.

    terraform plan -var="project_description=HelloWorld"

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-LI-13 Workspaces

**Note: All the L101-LI-[*] labs are part of a sequence and build upon each other.**

Do we have a workspace already?

    terraform workspace list

Of course, it's the default one.

Let's deploy a project

    terraform apply
    terraform state list
    terraform state show []

## New workspace

Let's create a new workspace

    terraform workspace new dev
    terraform workspace list

Change the label name to something different, and deploy

    label_name = "k8slab2"
    terraform apply
    linode-cli linodes list

Check the state file

    terraform state list
    terraform state show []

Let's destroy this project

    terraform destroy

## Switch back to the default workspace

    terraform workspace select default

But we still share the main.tf file between all workspaces!

Change the name back and delete the dev workspace.

    label_name = "k8slab"
    terraform workspace delete dev
    terraform workspace list
    terraform destroy
    linode-cli linodes list

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-LI-15 Modules

**Note: All the L101-LI-[*] labs are part of a sequence and build upon each other.**

## The Naming module

Let's use a module from the Terraform registry. It's a module that helps with the naming or resources and we'll use it to generate a unique name for our project.  You can look at the documentation here: https://registry.terraform.io/modules/Azure/naming/azurerm/latest

In the **main.tf** file, add the module using the following code. We'll prefix the generated names with the **lab** string.

    module "naming" {
      source = "Azure/naming/azurerm"
      prefix = ["lab"]
    }

Next, replace the label parameter line with this one:

    label  = module.naming.app_service.name_unique

Save the file and let's create a plan.  We have an error!  We first need to run init to download the module.

    terraform init
    terraform plan
    terraform apply

Let's see what was generated

    linode-cli linodes list

Let's now delete the project by typing

    terraform destroy

Let's check

    linode-cli linodes list

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-LI-16 Output variables

**Note: All the L101-LI-[*] labs are part of a sequence and build upon each other.**

## Create a new file

Create a new file named **output.tf**

## Edit the **output.tf** file

Add the following output variables

    output "linode_id" {
      value = linode_instance.lab.id
    }
 
    output "linode_label" {
      value = linode_instance.lab.label
    }

    output "public_ip" {
      value = linode_instance.lab.ip_address
    }

    output "linode_status" {
      value = linode_instance.lab.status
    }

## Validate and deploy

    terraform validate
    terraform apply

Let's check

    linode-cli linodes list

You should see the output values

## Destroy

Let's now delete the project by typing

    terraform destroy

Let's check

    linode-cli linodes list

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-LI-17 HCL Language

**Note: All the L101-LI-[*] labs are part of a sequence and build upon each other.**

Let's create 3 droplets by using a for_each loop.

## Cleanup main.tf

Edit the **main.tf** file and remove everything except the terraform and provider blocks.

    resource "Linode_droplet" "mydroplet" {
      for_each = toset( ["demo1", "demo2", "demo3"] )
      name   = each.key
      image  = "ubuntu-21-10-x64"      
      region = "nyc1"
      size   = "s-1vcpu-1gb"
    }

Replace the code in the **output.tf** file with this one

    output "linode_id" {
      value =  {
        for k, lab in linode_instance.lab : k => lab.id
      }
    }

    output "linode_label" {
      value = {
        for k, lab in linode_instance.lab : k => lab.label
      }
    }

    output "public_ip" {
      value = {
        for k, lab in linode_instance.lab : k => lab.ip_address
      }
    }

    output "linode_status" {
      value = {
        for k, lab in linode_instance.lab : k => lab.status
      }
    }

Generate a plan and deploy

    terraform plan
    terraform apply

Let's check

    linode-cli linodes list

Let's now delete the project by typing

    terraform destroy

Let's check

    linode-cli linodes list

## Cleanup

You can delete the files.