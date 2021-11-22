#!/bin/bash
set -e

TAG_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:jdk11-latest

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest
docker build . -f ./java.Dockerfile -t ${TAG_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_LATEST}
fi