FROM debian:stretch-slim
MAINTAINER skim <skimla@gmail.com>

ENV HOME /root

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y gnu-smalltalk

WORKDIR /koans
