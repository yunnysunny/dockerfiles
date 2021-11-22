#!/bin/bash
set -e

TAG_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest

docker pull centos:7
docker build . -f ./second.Dockerfile -t ${TAG_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_LATEST}
fi