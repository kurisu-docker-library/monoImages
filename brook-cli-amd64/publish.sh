#!/bin/bash

# 定义变量
IMAGE_NAME="kurisux/brook-cli"
TAG="latest"  # 你可以修改为你需要的标签
docker rmi -f ${IMAGE_NAME}:${TAG}

# 在当前目录构建Docker镜像
docker build --no-cache -t ${IMAGE_NAME}:${TAG} .

# 将镜像推送到Docker Hub
docker push ${IMAGE_NAME}:${TAG}
