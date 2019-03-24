# GumGum caching service app
FROM ubuntu:16.04
MAINTAINER devops <ramhh4l@gmail.com>
FROM python:latest

#install redis-server
RUN apt-get update && apt-get install -y \
    python-pip \
    redis-server

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#copy all local files to container
COPY ./* /usr/src/app/

#Install requirements
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

#start redis-server with caching service app
RUN service redis-server restart && python server.py
CMD redis-server start


