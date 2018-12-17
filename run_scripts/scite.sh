#!/bin/bash

STATE=$(docker ps --all --filter="name=scite" --format="exists")

if [ "$STATE" == "" ]
then
docker run -d \
  --rm \
  --name=scite \
  --cap-add=SYS_ADMIN \
  --security-opt seccomp:unconfined \
  --env="DISPLAY=$DISPLAY" \
  --env="HOST_UID=$(id -u)" \
  --env="HOST_GID=$(id -g)" \
  --env="HOME=/home/docker" \
  --log-driver=journald \
  --volume="/etc/localtime:/etc/localtime:ro" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --volume="/tmp:/home/docker/tmp:rw" \
  --volume="$HOME:/home/docker:rw" \
  --volume="/usr/share/fonts:/usr/share/fonts:ro" \
  --volume="/etc/fonts:/etc/fonts:ro" \
  --volume="$HOME/.Xauthority:/home/docker/.Xauthority:ro" \
  scite $1
else
  docker exec scite /bin/scite.sh $1
fi


#  --volume="/usr/share/icons:/usr/share/icons:ro" \

