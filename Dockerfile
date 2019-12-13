FROM jupyter/datascience-notebook

ADD requirements.txt /requirements.txt

USER root

RUN apt update && \
    apt install -y vim && \
    apt install -y pkg-config && \
    pip install -r /requirements.txt

