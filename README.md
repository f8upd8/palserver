# palserver
This is PalWorld Server, runnable in docker. This will spin up an ubuntu image, download steamcmd, palserver and dependencies and then run it. Entrypoint is directly on the PalServer.sh, so you can supply all launch options you want.

# Installation

## 1. Docker Installation

First, make sure you have docker installed. Follow instructions from this page for your platform: https://docs.docker.com/engine/install/

## 2. Build & Run Docker Image

```bash
# Server build command
docker build . --tag palserver
docker run -p 18211:18211/tcp -p 18211:18211/udp --mount type=bind,source="./Saved",target=/srv/palworld/Pal/Saved -d palworld port=18211
# Or specify your options
docker run -p <SERVER PORT>:8211/tcp -p <SERVER PORT>:8211/udp --mount type=bind,source="<PATH WHERE YOU WANT YOUR SERVER DATA AND CONFIG SAVED>",target=/srv/palworld/Pal/Saved palworld port=<SERVER PORT> <SPECIFY LANUCH OPTIONS>
```

## Advanced Configuration

#TODO
