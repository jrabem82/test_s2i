FROM docker.io/library/ubuntu:18.04

RUN apt-get update

RUN apt-get install tar gcc 

COPY temps.c /tmp/temps.c