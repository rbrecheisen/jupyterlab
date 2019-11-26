#!/bin/bash

docker-compose down

if [ "$1" == "clear" ]; then
	docker volume rm restheart_restheart-db
fi
