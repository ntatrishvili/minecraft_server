#! /bin/sh

wget https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar

apt update
apt upgrade
apt install openjdk-18-jre -y

java -jar ./server.jar