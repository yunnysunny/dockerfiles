#!/bin/bash
set -e

TAG_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:jmeter-latest
JMETER_VERSION=5.4.1
docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:jdk11-latest
docker build . -f ./java.Dockerfile -t ${TAG_LATEST} --progress=plain  --build-arg JMETER_VERSION=${JMETER_VERSION}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_LATEST}
fi