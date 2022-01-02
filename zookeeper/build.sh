#!/bin/bash
set -e
ZOOKEEPER_VERSION=3.7.0

docker pull openjdk:11
docker build . -f Dockerfile -t registry.cn-hangzhou.aliyuncs.com/whyun/base:zookeeper-${ZOOKEEPER_VERSION} --build-arg ZOOKEEPER_VERSION=${ZOOKEEPER_VERSION}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push registry.cn-hangzhou.aliyuncs.com/whyun/base:zookeeper-${ZOOKEEPER_VERSION}
fi



