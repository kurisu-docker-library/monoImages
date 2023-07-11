#!/bin/bash
set -e

for v in */; do
  v="${v%/}"
  sed "s/%VERSION%/$v/g" Dockerfile.template > "$v/Dockerfile"
  imageTag="kurisux/ubuntu-sshd-ex:${v}"
  cd $v
  docker build -t $imageTag .
  docker push $imageTag
  cd -
done

for v in */; do
  v="${v%/}"
  sed "s/%VERSION%/$v/g" Dockerfile.template.armv8 > "$v/Dockerfile"
  imageTag="kurisux/ubuntu-sshd-ex:armv8-${v}"
  cd $v
  docker build -t $imageTag .
  docker push $imageTag
  cd -
done
