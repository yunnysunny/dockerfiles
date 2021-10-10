#!/bin/bash
set -e

GO_VERSION=1.17.2
GOPRIVATE=gitlab.com
TAG_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:golang-latest
TAG_CURRENT=registry.cn-hangzhou.aliyuncs.com/whyun/base:golang-${GO_VERSION}

docker pull centos:7
docker build . -f ./Dockerfile -t ${TAG_LATEST} -t ${TAG_CURRENT} \
    --build-arg GO_VERSION=${GO_VERSION} --build-arg GOPRIVATE=${GOPRIVATE}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_LATEST}
    docker push ${TAG_CURRENT}
fi