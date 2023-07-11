#!/bin/bash
set -e



for v in */; do
  v="${v%/}"
  sed "s/%VERSION%/$v/g" Dockerfile.template > "$v/Dockerfile"
  imageTag="kurisux/ubuntu-sshd-ex:${v}"
  docker rmi -f $imageTag
  cd $v
  docker build -t $imageTag .
  docker push $imageTag
  cd -
done

docker buildx create --use

for v in */; do
  v="${v%/}"
  sed "s/%VERSION%/$v/g" Dockerfile.template.armv8 > "$v/Dockerfile"
  imageTag="kurisux/ubuntu-sshd-ex:armv8-${v}"
  docker rmi -f $imageTag
  cd $v
  docker buildx build --platform linux/arm64 --no-cache -t $imageTag --push .
#  docker push $imageTag
  cd -
done
