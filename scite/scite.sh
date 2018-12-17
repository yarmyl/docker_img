#!/bin/bash

EXISTS=$(getent group hostgroup)
if [ "$EXISTS" == "" ]; then
groupadd -g $HOST_GID -o hostgroup
usermod -u $HOST_UID -g $HOST_GID docker
fi
su - docker -c "scite $HOME/$1"
