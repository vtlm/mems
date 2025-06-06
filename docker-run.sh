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
