# L102-LI-02

## Create an Object Storage bucket

To use a backend in Linode, let's first create an S3 bucket using the Web Console.

Click the **Object Storage** menu and on the **Create Bucket** button.

Name your bucket and select **Newark** as the region. Note that if you select a different region, you'll have to change the values in the code using **us-east-1** to the region you selected.

Linode will display a popup, click on the **Enable Object Storage** button.

## Edit the main.tf file

Edit the **main.tf** file and locate your bucket name and endpoint. Click on the **details** link.

Copy the endpoint.

Edit the **main.tf** file, paste the endpoint as the endpoint value.

    endpoint = "us-east-1.linodeobjects.com" 

Set the bucket name.

    bucket = "terraformbackend"

## Create an access key

Click on the **Access Keys** tab, and click on the **Create Access Key** button.

Name the key and make sure to select the **Read/Write** scope for your bucket.

A key and a secret will be generated.

Copy the key and use it for the **access_key** value.

    access_key = ""

Copy the secret and use it for the **secret_key** value.

    secret_key = ""    

## Personal access token

Use your DigitalOcean **personal access token** as the provider token value. If you don't remember it, simple create a new one by clicking on the **API Tokens** link.

Set the token

    token = ""

Save the file.

## Let's init the backend

    terraform init

## Validate & Deploy

We will create a new Linode. You can replace the image, region an type values to your liking.

List the images slugs

    linode-cli images list

List the regions slugs

    linode-cli regions list

List the Linode sizes slugs

    linode-cli linodes types

Validate you code

    terraform validate

Deploy

    terraform apply

Head to the console and validate that the linode was created or check using the CLI

    linode-cli linodes list

## State file

Locate the Space. You should see the state file.

## Cleanup

Delete the droplet.

    terraform destroy

You can also delete the bucket by clicking on the **Delete** button. Note that you must delete all files from it before deleting the bucket.

Note that you will still be billed for Object Storage unless you cancel it.

Confirm by typing the bucket name.

In your account settings, click on the the **Cancel Object Storage** button.
