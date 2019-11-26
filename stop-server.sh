#!/bin/bash

if [ "${1}" != "--no-restheart" ]; then
	cd restheart
	./stop-server.sh
fi

docker stop jupyterlab
docker rm jupyterlab
