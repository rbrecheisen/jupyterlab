FROM jupyter/datascience-notebook

USER root

RUN apt update && \
    apt install -y vim && \
    apt install -y pkg-config
