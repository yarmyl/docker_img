#!/bin/bash

STATE=$(docker ps -a | grep firefox | awk '{print $12, $13, $14, $15}' | sed '{s/ *$//g}' | grep "firefox$")

if [ "$STATE" == "" ]
then
docker run -d \
  --name=firefox \
  --group-add audio \
  --cap-add=SYS_ADMIN \
  --security-opt seccomp:unconfined \
  --net=host \
  --env="DISPLAY" \
  --env="HOST_UID=$(id -u)" \
  --env="HOST_GID=$(id -g)" \
  --device /dev/snd \
  --log-driver=journald \
  --volume="/etc/localtime:/etc/localtime:ro" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --volume="/dev/shm:/dev/shm:rw" \
  --volume="$HOME/Downloads:/home/docker/Downloads:rw" \
  --volume="/usr/share/fonts:/usr/share/fonts:ro" \
  --volume="/etc/fonts:/etc/fonts:ro" \
  --volume="/var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket:ro" \
  --volume="$HOME/.Xauthority:/home/docker/.Xauthority:ro" \
  --volume="$HOME/tmp_docker/.mozilla/firefox:/home/docker/.mozilla/firefox:rw" \
  -e PULSE_SERVER=unix:$XDG_RUNTIME_DIR/pulse/native \
  firefox
else
  docker start firefox
fi

#  --volume="/usr/share/icons:/usr/share/icons:ro" \

