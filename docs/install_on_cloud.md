# Create Minecraft server on cloud
The following documentation describes the process of renting a cloud server, setting up the users and downloading necessary packages to run our program on cloud. 

## Table of contents
1. Making a Digital Ocean Account
2. Creating a cloud server
3. Server set-up
4. Useful links

## Making a Digital Ocean account
If you have never had an account, most of cloud provides have an option for 1-month 100$ credit, giving you a chance to test-run for free. 

1. search for free coupons on internet
2. make an account directly from the coupon link
3. double-check that you are creating the account with the coupon
4. input your personal information
5. wait for the security check

## Creating a cloud server
After the sign-in, you can change the name and description for the template project and start creating a droplet

1. Create a droplet from upper-right corner
![Create_droplet](..\Screenshots\Create_droplet.png)
2. Choose the parameters:
    1. Region: Frankfurt
    2. Image: Ubuntu, version: 22.4 (LTS) x64
    3. Size: Regular, $24/mo
    4. SSH key:
        1. find your ssh key from github.com/[your_username].keys
        2. paste your key to DigitalOcean and name it
    5. Create droplet

After you have a droplet, you can find it in your project page. 

## Server set-up
1. Access your server
    1. Copy the ip address of the server from the droplet public key (should look like 123.12.111.222) 
    2. Open powershell/terminal locally
    3. go to the server by typing: 
    ```
    ssh root@[your_ip]
    yes
    ```
2. Set up packages:
    1. update all packages:
    ```
    Apt update *
    Apt upgrade
    ```
    2. Set up minecraft according to [install_minecraft.md](.\install_minecraft.md) documentation
3. Add ssh keys:
    1. 
    

## Useful Links
- ![DigitalOcean free credit](https://try.digitalocean.com/freetrialoffer/)
- ![The coolest guy ever](https://github.com/samerbahri98)
- 
