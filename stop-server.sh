#!/bin/bash

cd restheart

./stop-server.sh

docker stop jupyterlab
docker rm jupyterlab
