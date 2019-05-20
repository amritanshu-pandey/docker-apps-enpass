#!/bin/bash
set -eu

DOCKER_IMAGE=amritanshu16/enpass:latest
LOCAL_DATA_DIR="$HOME/Documents/docker_apps_data/Enpass"

action=${1:-run}

if [ ${action} = 'run' ]
then
	if docker inspect enpass
	then
	docker exec enpass /opt/enpass/Enpass
	else
		echo "Starting Enpass"
		docker run -d --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY \
		--name enpass \
		-v "${LOCAL_DATA_DIR}/config:/root/.config/sinew.in/" \
		-v "${LOCAL_DATA_DIR}/data:/root/Documents/Enpass" \
		${DOCKER_IMAGE}
	fi
else
	echo "Stopping Enpass"
	docker kill enpass
fi

