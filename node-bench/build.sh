#!/bin/bash
set -e
VERSION=0.2.0
TAG_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:node-bench-latest
TAG_VERSION=registry.cn-hangzhou.aliyuncs.com/whyun/base:node-bench-${VERSION}

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest
docker build ./docker -f ./bench.Dockerfile -t ${TAG_LATEST} -t ${TAG_VERSION} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_LATEST}
    docker push ${TAG_VERSION}
fi