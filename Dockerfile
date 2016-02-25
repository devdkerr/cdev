FROM ubuntu:trusty
MAINTAINER Daniel R. Kerr <daniel.r.kerr@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
 && apt-get install -qq -y curl git make wget \
 && apt-get install -qq -y build-essential \
 && apt-get install -qq -y python python-dev python-pip \
 && apt-get install -qq -y python3 python3-dev python3-pip \
  && apt-get clean \
 && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN wget -O /usr/local/bin/waf https://waf.io/waf-1.8.19 \
 && chmod +x /usr/local/bin/waf

VOLUME ["/root/prj"]

WORKDIR /root/prj