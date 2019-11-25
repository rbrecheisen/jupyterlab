#!/bin/bash

export MONGO_USER="restheart"
export MONGO_PASSWORD=$(cat ~/password-mongodb.txt)

./stop-server.sh

docker-compose up -d
