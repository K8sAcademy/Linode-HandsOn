# L12-LI-02

Let's create a new Linode VPS with Docker pre-installed from the Marketplace.

## Cloud Manager

Log into the Linode Cloud Manager and click on **Marketplace** from the left menu, then click on **Docker**.

## Docker Options

Scroll down and locate the **Docker Options** section.

In the **Command ro run?** textbox enter this command:

    docker run --name hello --restart unless-stopped -p 80:8080 k8sacademy/hello-app:1.0

## Image Options

Scroll down and select the latest version of the proposed Linux distro.  Select a region near you and the Nanode 1GB plan.

You can change the label if you want.  Enter a password and if you have an SSH key tied with your account, ytou can select it.  Then click on the **Create Linode** button.


## Test in a browser

Locate the public IP address and test it in a browser.

## Cleanup

Do not delete your Linode yet.  We will use it in the next lab.
