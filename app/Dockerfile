FROM ubuntu:22.04

RUN apt update && apt install -y openjdk-18-jre

WORKDIR /minecraft

ADD https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar .

COPY . .

VOLUME [ "/minecraft" ]

EXPOSE 25565

RUN chmod -R o=u /minecraft

ENTRYPOINT [ "java" ]

CMD [ "-jar", "./server.jar" ]