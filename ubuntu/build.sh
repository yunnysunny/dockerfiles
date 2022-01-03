#!/bin/bash
set -e

TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:ubuntu-latest
TAG_OFFICAL_LATEST=yunnysunny/ubuntu
SAVE_NAME=ubuntu
. "$(dirname "$PWD")/util/docker_cache.sh"
load_cache $SAVE_NAME

docker pull ubuntu:latest
docker build ./docker -f ./Dockerfile -t ${TAG_ALI_LATEST} -t ${TAG_OFFICAL_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then docker push ${TAG_OFFICAL_LATEST}; fi
fi

save_cache $SAVE_NAME ${TAG_ALI_LATEST} ${TAG_OFFICAL_LATEST}