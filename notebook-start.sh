#!/bin/bash

# WARNING: Do not edit this script. It only runs inside the Docker container and serves
# to install additional Python packages and startup JupyterLab

apt update
apt install -y vim

pip install -r /home/jovyan/requirements.txt

/usr/local/bin/start-notebook.sh --NotebookApp.keyfile=/etc/ssl/jupyter/espresso.key --NotebookApp.certfile=/etc/ssl/jupyter/espresso.crt
