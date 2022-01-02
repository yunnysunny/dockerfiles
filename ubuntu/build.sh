#!/bin/bash
set -e

TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:ubuntu-latest
TAG_OFFICAL_LATEST=yunnysunny/ubuntu


docker pull ubuntu:latest
docker build ./docker -f ./Dockerfile -t ${TAG_ALI_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
fi