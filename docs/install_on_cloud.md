# Create Minecraft server on cloud
The following documentation describes the process of renting a cloud server, setting up the users and downloading necessary packages to run our program on cloud. 

## Table of contents
1. Making a Digital Ocean Account
2. Creating a cloud server
3. Create ssh key for your device
4. Server set-up
5. Useful links

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

## Create ssh key
1. open powershell
2. type in:
   ```
   wsl
   ssh-keygen.exe
   ```
3. go to ```C:\[your user]\.ssh``` and
   1. copy the contents of ```id_rsa.pub``` file and paste into github ssh keys. Now you can access them at github.com/[your_username].keys
   2. update the config file in the same directory with 
   ```
   Host *
   IdentityFile C:\Users\User\.ssh\id_rsa
   ```

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
3. Add users:
   1. add the username
   ```
   useradd [your_username]
   ```
   2. set the password:
   ```
   passwd [your_username]
   ```
   3. give sudo rights
   ```
   usermod aG sudo [your_username]
   ```
   4. switch to your user
   ```
   su - [your_username]
   ``` 
4. Add the user to your local ```C:\[your user]\.ssh\config``` file
5. now you can acess the server with 
    ```
    ssh your_username@[server_ip]
    ```    

## Useful Links
- ![DigitalOcean free credit](https://try.digitalocean.com/freetrialoffer/)
- ![The coolest guy ever](https://github.com/samerbahri98)
- 
