#!/bin/bash

export MONGO_PASSWORD=$(cat ~/password-mongodb.txt)

docker-compose up -d

docker-compose logs -f
