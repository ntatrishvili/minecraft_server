# import paramiko

# #Set up server

# host = "170.187.186.57"

# client = SSHClient()
# client.load_system_host_keys()
# client.connect(pkey='', )


# #install java
# client.exec_command('apt update')
# client.exec_command('apt upgrade -y')
# client.exec_command('apt install openjdk-18-jre git -y')

# #clone minecraft_sever repository
# client.exec_command('git clone git@github.com:ntatrishvili/minecraft_server.git')

# #change directory to app folder
# client.exec_command('cd minecraft_server/app && bash ./run.sh')


# output = stdout.read().decode()

# # Print the output
# print(output)

# # Close the SSH connection
# ssh_client.close()