#!/bin/bash
set -e

TAG_ALI_LATEST_CENTOS=registry.cn-hangzhou.aliyuncs.com/whyun/base:supervisor-latest
TAG_OFFICAL_LATEST_CENTOS=yunnysunny/supervisor
TAG_ALI_LATEST_UBUNTU=registry.cn-hangzhou.aliyuncs.com/whyun/base:supervisor-ubuntu-latest
TAG_OFFICAL_LATEST_UBUNTU=unnysunny/supervisor-ubuntu
CENTOS_IMAGE=centos:7
UBUNTU_IMAGE=ubuntu
SAVE_NAME=supervisor
. "$(dirname "$PWD")/util/docker_cache.sh"
load_cache $SAVE_NAME

docker pull ${CENTOS_IMAGE}
docker build . -f ./Dockerfile \
    -t ${TAG_ALI_LATEST_CENTOS} \
    -t ${TAG_OFFICAL_LATEST_CENTOS} \
    --build-arg IMAGE_NAME=${CENTOS_IMAGE} \
    --build-arg IMAGE_TYPE=centos \
    --build-arg CRON_START_OPTION=n \
    --progress=plain
docker pull ${UBUNTU_IMAGE}
docker build . -f ./Dockerfile \
    -t ${TAG_ALI_LATEST_UBUNTU} \
    -t ${TAG_OFFICAL_LATEST_CENTOS} \
    --build-arg IMAGE_NAME=${UBUNTU_IMAGE} \
    --build-arg IMAGE_TYPE=ubuntu \
    --build-arg CRON_START_OPTION=f \
    --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST_CENTOS}
    docker push ${TAG_ALI_LATEST_UBUNTU}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then
        docker push $TAG_OFFICAL_LATEST_CENTOS
        docker push ${TAG_OFFICAL_LATEST_UBUNTU}
    fi
fi

save_cache $SAVE_NAME ${TAG_ALI_LATEST_CENTOS} ${TAG_OFFICAL_LATEST_CENTOS} ${TAG_ALI_LATEST_UBUNTU} ${TAG_OFFICAL_LATEST_UBUNTU}