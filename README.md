# palserver
This is PalWorld Server, runnable in docker. This will spin up an ubuntu image, download steamcmd, palserver and dependencies and then run it. Entrypoint is directly on the PalServer.sh, so you can supply all launch options you want.

# Installation

## 0. Docker Installation

First, make sure you have docker installed. Follow instructions from this page for your platform: https://docs.docker.com/engine/install/

## 1. Save dockerfile into a directory and run a terminal inside of it. Recommended way:

```bash
# Run this in a windows terminal, or a linux shell
git clone https://github.com/f8upd8/palserver.git
cd palserver
```

## 2. Build & Run Docker Image

```bash
# Server build command
docker build . --tag palserver
# Fill the < > brackets in the command and run it
docker run \
 -p <SERVER PORT>:8211/tcp \
 -p <SERVER PORT>:8211/udp \
 --mount type=bind,source="<PATH WHERE YOU WANT YOUR SERVER DATA AND CONFIG SAVED>",target=/srv/palworld/Pal/Saved \
 -d --restart=<Restart Policy) palworld port=<SERVER PORT> <AFTER THIS YOU CAN SPECIFY OTHER LAUNCH OPTIONS>
# Or just use suggested defaults, your server's files will be saved into the current directory in the *Saved* folder and with default 8211 port.
docker run -p 8211:8211/tcp -p 8211:8211/udp --mount type=bind,source="./Saved",target=/srv/palworld/Pal/Saved -d --restart=unless-stopped palworld port=8211
# With this, server should be working.
```


## Advanced Configuration

#TODO
