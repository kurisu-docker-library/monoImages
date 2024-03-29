#!/bin/bash

# 定义变量
IMAGE_NAME="kurisux/brook-cli"
TAG="linux_arm64"  # 你可以修改为你需要的标签

docker rmi -f ${IMAGE_NAME}:${TAG}

# 创建 buildx 实例并使用
docker buildx create --use

# 在当前目录构建Docker镜像，并推送到 Docker Hub
docker buildx build --platform linux/arm64 --no-cache -t ${IMAGE_NAME}:${TAG} --push .

# 将镜像推送到Docker Hub
#docker push ${IMAGE_NAME}:${TAG}
