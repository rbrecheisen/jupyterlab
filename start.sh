#!/bin/bash

export MONGO_PASSWORD=$(cat ../mongopassword.txt)

docker-compose down; docker-compose up -d
docker-compose logs -f
