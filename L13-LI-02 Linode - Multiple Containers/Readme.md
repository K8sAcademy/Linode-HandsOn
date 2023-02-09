# Multiple Containers

Let’s deploy a multi containers app.

---

## Optionally, build the Reverse Proxy and push it to a registry

    docker build -t [yourRegistry]/reverseproxy:latest .
    docker push [yourRegistry]/reverseproxy:latest

Edit the Docker-Compose file to change the location of the Reverse Proxy image.

---

## Test the app locally

Use docker-compose to build and run the app locally.

    docker-compose up -d

Open a browser and type http://localhost/hello

In a new browser tab, type http://localhost/bonjour

Notice that the server name is different.

---

## Cloud Manager

Head to the Cloud Manager and create a new Linode using the Docker app from the Marketplace.

In the **Resource to Download?** field, use the following URL:

    https://raw.githubusercontent.com/K8sAcademy/Azure-HandsOn/main/L13-AZ-06%20Web%20App%20for%20Containers%20-%20Multiple%20Containers/docker-compose.yml

---

## Optionally, deploy using the command line

If you want to upload the file manually, you can use:

    scp docker-compose.yml user@remote-host-ip:docker-compose.yml

or

    sftp user@remote-host-ip
    >put docker-compose.yml
    >exit

---

In the **Command to run?** field enter this:

    docker-compose up -d

## Test in a browser

Once created, click on the overview page and locate the Linode URL.  In a new browser tab, test both routes and notice that the server names are different.

## Cleanup

In the Cloud Manager, delete the resource you just created.
