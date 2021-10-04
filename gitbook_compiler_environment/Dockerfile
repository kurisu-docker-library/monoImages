FROM ubuntu:latest

LABEL maintainer="Amatist Kurisu<misaki.zhcy@gmail.com>"

USER root

RUN apt update \
&& apt install curl sudo git gcc g++ make ssh -y \
&& curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
&& apt install -y nodejs \
&& npm install gitbook-cli  -g \
&& gitbook -V
