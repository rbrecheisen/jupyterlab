#!/bin/bash

# WARNING: Do not edit this script. It only runs inside the Docker container and serves
# to install additional Python packages and startup JupyterLab

pip install --no-cache-dir -r /home/jovyan/requirements.txt

#/usr/local/bin/start-notebook.sh --NotebookApp.keyfile=/etc/ssl/jupyter/espresso.key --NotebookApp.certfile=/etc/ssl/jupyter/espresso.crt

/usr/local/bin/start-notebook.sh
