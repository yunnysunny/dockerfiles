#!/bin/bash
set -e

TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:hello-latest
TAG_OFFICAL_LATEST=yunnysunny/hello

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest
docker build ./docker -f ./hello.Dockerfile -t ${TAG_ALI_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
fi