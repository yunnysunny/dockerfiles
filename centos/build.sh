#!/bin/bash
set -e

TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest
TAG_OFFICAL_LATEST=yunnysunny/centos

docker pull centos:7
docker build . -f ./second.Dockerfile -t ${TAG_ALI_LATEST} -t ${TAG_OFFICAL_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then docker push $TAG_OFFICAL_LATEST fi
fi

JAVA_TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:jdk11-latest
JAVA_TAG_OFFICAL_LATEST=yunnysunny/jdk11

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest
docker build . -f ./java.Dockerfile -t ${JAVA_TAG_ALI_LATEST} -t ${JAVA_TAG_OFFICAL_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${JAVA_TAG_ALI_LATEST}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then docker push $JAVA_TAG_OFFICAL_LATEST fi
fi