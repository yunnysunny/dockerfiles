#!/bin/bash
set -e

TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest
TAG_OFFICAL_LATEST=yunnysunny/centos

docker pull centos:7
docker build . -f ./second.Dockerfile -t ${TAG_ALI_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
fi