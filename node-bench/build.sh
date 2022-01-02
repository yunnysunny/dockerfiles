#!/bin/bash
set -e
VERSION=0.2.0
TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:node-bench-latest
TAG_OFFICAL_LATEST=yunnysunny/node-bench
TAG_ALI_VERSION=registry.cn-hangzhou.aliyuncs.com/whyun/base:node-bench-${VERSION}
TAG_OFFICAL_VERSION=yunnysunny/node-bench:${VERSION}

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest
docker build ./docker -f ./bench.Dockerfile \
    -t ${TAG_ALI_LATEST} \
    -t ${TAG_OFFICAL_LATEST} \
    -t ${TAG_ALI_VERSION} \
    -T ${TAG_OFFICAL_VERSION} \
    --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
    
    docker push ${TAG_ALI_VERSION}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then
        docker push $TAG_OFFICAL_LATEST
        docker push ${TAG_OFFICAL_VERSION}
    fi
fi