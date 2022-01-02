#!/bin/bash
set -e

TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:jdk11-latest
TAG_OFFICAL_LATEST=yunnysunny/jdk11

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest
docker build . -f ./java.Dockerfile -t ${TAG_ALI_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
fi