#!/bin/bash

export MONGO_PASSWORD=$(cat ~/password-mongodb.txt)

./stop.sh $1

docker-compose up -d

docker-compose logs -f
