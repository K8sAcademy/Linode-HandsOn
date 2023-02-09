# L14-LI-02

Let's create and use a  volume.

## Create a new Linode

Leave the Docker Options empty.

## Create a new Block Storage volume

In Cloud Manager, click on **Volumes** in the left menu then click **Create Volume**.

Name the volume myvolume-20 with a size of 20GB
Select the same data center that you used for your Linode and click on **Create Volume**.

## Mount the volume

You need to run 3 commands and edit a file with the info provided in the volume configuration popup.

Open a session to your Linode in a terminal or use the Weblish console.

Run the commands in lines marked as 1, 2 and 3 in the previous screenshot

Next, edit the /etc/fstab by typing

    nano /etc/fstab

Paste the info marked as 4 in the previous screenshot.  Save the file and exit nano.

    CTRL O
    CTRL X

Validate that the volume was mounted

    ls /mnt

## Run a Nginx container that will use the volume

    docker run -d --name voltest1 -v myvolume-20:/lab nginx:latest

## Connect to the instance

    docker exec -it voltest1 bash

## Let’s create a file in the volume

    cd lab
    echo Hello from Voltest1 > Hello1.txt

Detach from the instance:

    exit

## Run a second Nginx container that will use the volume

    docker run -d --name voltest2 -v myvolume-20:/lab nginx:latest

## Connect to the instance

    docker exec -it voltest2 bash

## Is the file visible?

    ls lab
    exit

## Cleanup

You can delete the Linode and the Block-Storage volume.