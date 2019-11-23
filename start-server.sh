#!/bin/bash

./stop-server.sh

docker run -d --name jupyterlab \
	-p 443:8888 \
	-e JUPYTER_ENABLE_LAB=yes \
	-v $(pwd)/../.jupyter:/home/jovyan/.jupyter \
	-v $(pwd)/../work:/home/jovyan/work \
	-v $(pwd)/../ssl/espresso.maastrichtuniversity.nl.key:/etc/ssl/jupyter/espresso.maastrichtuniversity.nl.key \
	-v $(pwd)/../ssl/espresso.maastrichtuniversity.nl.crt:/etc/ssl/jupyter/espresso.maastrichtuniversity.nl.crt \
	jupyter/datascience-notebook start-notebook.sh \
		--NotebookApp.keyfile=/etc/ssl/jupyter/espresso.maastrichtuniversity.nl.key \
		--NotebookApp.certfile=/etc/ssl/jupyter/espresso.maastrichtuniversity.nl.crt

docker exec -it jupyterlab bash -c "pip install xnat"
docker exec -it jupyterlab bash -c "pip install pymongo"
docker exec -it jupyterlab bash -c "pip install ipywidgets"
docker exec -it jupyterlab bash -c "pip install RISE"
docker exec -it jupyterlab bash -c "pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master"
docker exec -it jupyterlab bash -c "pip install jupyter_nbextensions_configurator"

docker exec -it jupyterlab bash -c "jupyter contrib nbextension install --user"
docker exec -it jupyterlab bash -c "jupyter nbextensions_configurator enable --user"
docker exec -it jupyterlab bash -c "jupyter-nbextension install rise --py --sys-prefix"
docker exec -it jupyterlab bash -c "jupyter-nbextension enable rise --py --sys-prefix"

cd restheart

#export MONGO_USER=restheart
#export MONGO_PASSWORD=$(cat ~/password.txt)
export MONGO_USER=admin
export MONGO_PASSWORD=secret

docker-compose up -d

docker logs -f jupyterlab
