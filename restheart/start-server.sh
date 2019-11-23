#!/bin/bash

export MONGO_USER=admin
export MONGO_PASSWORD=secret

docker-compose up -d
docker-compose logs -f
