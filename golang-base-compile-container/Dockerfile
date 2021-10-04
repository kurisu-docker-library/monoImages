# step 0
FROM alpine:latest

RUN echo "export GO111MODULE=on" >> /etc/profile \
    && echo "export GOPATH=/root/go" >> /etc/profile \
    && echo "export PATH=\$PATH:/" >> /etc/profile \
    && source /etc/profile

# install
RUN apk update && apk add go git musl-dev xz binutils \
    && mkdir -p /usr/local/bin

# compression && packing
RUN wget https://github.com/upx/upx/releases/download/v3.95/upx-3.95-amd64_linux.tar.xz \
    && xz -d upx-3.95-amd64_linux.tar.xz \
    && tar -xvf upx-3.95-amd64_linux.tar \
    && cd upx-3.95-amd64_linux \
    && chmod a+x ./upx \
    && mv ./upx /usr/local/bin/
