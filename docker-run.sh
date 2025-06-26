#!/bin/bash
#$1 - container name
#$2 - path to mount from to
#$3 - path to run

#    --runtime=nvidia \
#	--gpus all \
#       --workdir="/home/$USER" \


docker run -it \
       --privileged \
       --network host \
       --env DISPLAY=$DISPLAY \
       --env="QT_X11_NO_MITSHM=1" \
       --env="XAUTHORITY=$XAUTH" \
       --volume="$XAUTH:$XAUTH" \
       -u `id -u`:`id -g` \
       --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
       --group-add $(getent group audio | cut -d: -f3) \
       --volume="/etc/passwd:/etc/passwd:ro" \
       --device /dev/snd \
       -v $2 \
       $1 $3

#node-js
 docker run -it -v ${PWD}:/mnt node:24.1.0-bookworm /bin/bash
 
 #mqttx-web
 docker run -d --name mqttx-web -p 80:80 emqx/mqttx-web

#emqx 
 docker run -d --name emqx-enterprise   -p 1883:1883 -p 8083:8083   -p 8084:8084 -p 8883:8883   -p 18083:18083   -v $PWD/data:/opt/emqx/data   -v $PWD/log:/opt/emqx/log   emqx/emqx-enterprise:5.9.0


