# installing minecraft server on your laptop

- Open vscode and powershell
- firstly, we write in powershell to get to linux:

```
wsl
apt update
apt upgrade
```

- install java: `sudo apt install openjdk-18-jre`
- download minecraft server go to the link: "https://www.minecraft.net/en-us/download/server"
- copy server.jar file: `cp /mnt/c/Users/student/Downloads/server.jar ~ `
- go to ~ file, which is located in wsl: `cd ~`
- execute a java program packaged as an executable JAR (java archive) file `java -jar ./server.jar`
- find the address `ip addr`
- add server to Minecraft with already known address
- in eula.txt change: `eula=true`
- in server.properties change:

```
online-mode=false
level-seed=12
```

- run the server: `java -jar ./server.jar`

### Useful Links:

- "https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-22-04" for java
- "https://www.minecraft.net/en-us/download/server" for minecraft server
