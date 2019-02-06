FROM ubuntu:bionic
MAINTAINER Daniel R. Kerr <daniel.r.kerr@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y \
 && apt-get install -qq -y cmake curl git make p7zip-full wget \
 && apt-get install -qq -y build-essential \
 && apt-get install -qq -y gcc-multilib g++-multilib libc6-dev libc6-dev-i386 \
 && apt-get install -qq -y golang \
 && apt-get install -qq -y python python-dev python-pip \
 && apt-get install -qq -y python3 python3-dev python3-pip \
 && apt-get clean \
 && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN wget -O /usr/local/bin/waf https://waf.io/waf-2.0.12 \
 && chmod +x /usr/local/bin/waf

RUN wget -O /tmp/fasm-1.73.04.tgz https://flatassembler.net/fasm-1.73.04.tgz \
 && cd /opt \
 && tar xvzf /tmp/fasm-1.73.04.tgz \
 && rm /tmp/fasm-1.73.04.tgz

VOLUME ["/root/prj"]

WORKDIR /root/prj
