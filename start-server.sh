#!/bin/bash
docker run -d --name jupyterlab \
	-p 80:8888 \
	-e JUPYTER_ENABLE_LAB=yes \
	-v $(pwd)/../jupyterlab_notebooks:/home/jovyan/work \
	-v $(pwd)/settings:/home/jovyan/settings \
	jupyter/datascience-notebook
docker logs -f jupyterlab
