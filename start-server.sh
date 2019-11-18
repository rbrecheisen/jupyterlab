#!/bin/bash

docker run -d --name jupyterlab \
	-p 443:8888 \
	-e JUPYTER_ENABLE_LAB=yes \
	-v $(pwd)/../.jupyter:/home/jovyan/.jupyter \
	-v $(pwd)/../work:/home/jovyan/work \
	-v $(pwd)/../espresso.maastrichtuniversity.nl.key:/etc/ssl/jupyter/espresso.maastrichtuniversity.nl.key \
	-v $(pwd)/../espresso.maastrichtuniversity.nl.crt:/etc/ssl/jupyter/espresso.maastrichtuniversity.nl.crt \
	-v $(pwd)/requirements.txt:/home/jovyan/requirements.txt \
	jupyter/datascience-notebook start-notebook.sh \
		--NotebookApp.keyfile=/etc/ssl/jupyter/espresso.maastrichtuniversity.nl.key \
		--NotebookApp.certfile=/etc/ssl/jupyter/espresso.maastrichtuniversity.nl.crt

docker exec -it jupyterlab bash -c "pip install -r requirements.txt"

docker logs -f jupyterlab
