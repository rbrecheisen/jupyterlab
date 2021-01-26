#!/bin/bash

export MONGO_PASSWORD=$(cat ../mongopassword.txt)

docker-compose down
