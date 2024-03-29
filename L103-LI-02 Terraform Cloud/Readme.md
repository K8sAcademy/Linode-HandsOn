# L103-LI-02

## Terraform Cloud

Log into your Terraform account

    https://app.terraform.io/

## Terminal

In VS Code, open a terminal, log using your Terraform Cloud credentials

    terraform login

## New workspace

Create a new CLI based workspace.

Locate the config code section

In the **main.tf** file, replacing the organization and workspace names.

Init the workspace

    terraform init

Let's add the variables in the Terraform Cloud workspace.

    linode_token = [your Linode token] (Mark as sensitive)
    region = us-east
    linode_name = mylinode
    root_password = terr4form-test (Mark as sensitive)

## Save the file and validate

    terraform validate

## Deploy

    terraform apply

## Let's see what was generated

Click on the **Runs tab**, you should see your first run.

## Cleanup

Let's now delete the droplet by typing

    terraform destroy

Delete the workspace by clicking on the **Settings tab** and on the **Delete from Terraform Cloud** button.
