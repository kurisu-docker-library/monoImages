FROM ubuntu:20.04


RUN apt install git cmake make libssl-dev build-essential -y

RUN git clone https://github.com/ntop/n2n.git

RUN cd n2n && \
    cmake . && \
    make \
    make install

