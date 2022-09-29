FROM ubuntu:22.04

RUN apt -y update

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt -y install \
	make gcc git vim nodejs npm

RUN mkdir -p /project /nl /mnt /share
RUN apt-get update
RUN apt-get install -y --reinstall build-essential

# Node Packages Installation

RUN cd /usr/local/share && git clone https://github.com/gabrieleromanato/node-fastify-ws-ping
RUN cd /usr/local/share/node-fastify-ws-ping && npm install

EXPOSE 3000


