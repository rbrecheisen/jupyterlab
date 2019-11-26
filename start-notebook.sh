#!/bin/bash

# ALERT! THIS SCRIPT WILL RUN INSIDE THE DOCKER CONTAINER!!!

pip install -r /home/jovyan/requirements.txt

/usr/local/bin/start-notebook.sh --NotebookApp.keyfile=/etc/ssl/jupyter/espresso.key --NotebookApp.certfile=/etc/ssl/jupyter/espresso.crt
