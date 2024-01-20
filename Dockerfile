FROM ubuntu:22.04
RUN apt update && apt upgrade -y
RUN dpkg --add-architecture i386 \
 && apt-get update -y && apt install wget lib32gcc-s1 lib32stdc++6 \
 curl libstdc++6:i386 lib32z1 sudo -y
RUN adduser --disabled-password paladmin
WORKDIR /usr/local/steamcmd
RUN chown paladmin /usr/local/steamcmd
RUN mkdir -p /srv/palworld
RUN chown paladmin /srv/palworld
USER paladmin
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -xz
RUN ./steamcmd.sh +force_install_dir /srv/palworld +login anonymous +app_update 2394010 validate +quit
RUN mkdir -p ~/.steam/sdk64/
WORKDIR /srv/palworld
RUN mkdir -p /home/paladmin/.steam/sdk64/
RUN cp ./linux64/steamclient.so /home/paladmin/.steam/sdk64/steamclient.so
ENTRYPOINT [ "./PalServer.sh"]