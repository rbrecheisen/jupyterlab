FROM jupyter/datascience-notebook

USER root

ADD notebook-start.sh /home/jovyan

RUN apt update && \
    apt install -y vim && \
    apt install -y pkg-config

