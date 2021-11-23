#!/bin/bash
set -e
# alinode 6.7.0 <=> node v14.18.1
ALINODE_VERSION=6.7.0
TAG_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest
TAG_VERSION=registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-${ALINODE_VERSION}

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest
docker build ./docker -f ./alinode.Dockerfile -t ${TAG_LATEST} -t ${TAG_VERSION} --progress=plain \
  --build-arg ALINODE_VERSION=${ALINODE_VERSION}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_LATEST}
    docker push ${TAG_VERSION}
fi