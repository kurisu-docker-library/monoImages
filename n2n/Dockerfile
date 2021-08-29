FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt install -y tzdata apt-utils && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt install git cmake make libssl-dev build-essential -y &&  \
    git clone https://github.com/rofl0r/proxychains-ng.git && \
    cd proxychains-ng && \
    ./configure && \
    make && \
    make install && \
    cp src/proxychains.conf /usr/local/etc/ && \
    cd - && \
    git clone https://github.com/ntop/n2n.git && \
    cd n2n && \
    git checkout 2.8-stable && \
    cmake . && \
    make && \
    make install && \
    rm /root/.cache -rf && \
    rm -rf /var/cache/apk/* /tmp/* && \
    apt remove git cmake make build-essential -y && \
    apt autoremove -y && \
    apt clean
