#!/bin/bash
docker stop jupyterlab
docker rm jupyterlab
cd restheart
docker-compose down
