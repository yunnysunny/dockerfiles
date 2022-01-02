#!/bin/bash
set -e

TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:hello-service-latest
TAG_OFFICAL_LATEST=yunnysunny/hello-service

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:hello-latest
docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:golang-latest
docker build ./hello-service -f ./hello-service.Dockerfile -t ${TAG_ALI_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
fi