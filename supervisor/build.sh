#!/bin/bash
set -e

TAG_LATEST_CENTOS=registry.cn-hangzhou.aliyuncs.com/whyun/base:supervisor-latest
TAG_LATEST_UBUNTU=registry.cn-hangzhou.aliyuncs.com/whyun/base:supervisor-ubuntu-latest
CENTOS_IMAGE=centos:7
UBUNTU_IMAGE=ubuntu
docker pull ${CENTOS_IMAGE}
docker build . -f ./Dockerfile -t ${TAG_LATEST_CENTOS} \
    --build-arg IMAGE_NAME=${CENTOS_IMAGE} \
    --build-arg IMAGE_TYPE=centos \
    --build-arg CRON_START_OPTION=n \
    --progress=plain
docker pull ${UBUNTU_IMAGE}
docker build . -f ./Dockerfile -t ${TAG_LATEST_UBUNTU} \
    --build-arg IMAGE_NAME=${UBUNTU_IMAGE} \
    --build-arg IMAGE_TYPE=ubuntu \
    --build-arg CRON_START_OPTION=f \
    --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_LATEST_CENTOS}
    docker push ${TAG_LATEST_UBUNTU}
fi