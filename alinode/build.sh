#!/bin/bash
set -e
# alinode 6.7.0 <=> node v14.18.1
ALINODE_VERSION=6.7.0
TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest
TAG_OFFICAL_LATEST=yunnysunny/alinode
TAG_VERSION=registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-${ALINODE_VERSION}
TAG_OFFICAL_VERSION=yunnysunny/alinode:${ALINODE_VERSION}

SAVE_NAME=alinode
CACHE_FILE=$CACHE_FROM_DIR/$SAVE_NAME

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest
BUILD_PARAMS="./docker -f ./alinode.Dockerfile -t ${TAG_ALI_LATEST} \
  -t ${TAG_OFFICAL_LATEST} -t ${TAG_VERSION} \
  -t ${TAG_OFFICAL_VERSION}
  --progress=plain \
  --build-arg ALINODE_VERSION=${ALINODE_VERSION}"
if [ -d "$CACHE_FROM_DIR" ] ; then
  BUILD_PARAMS="${BUILD_PARAMS}  --cache-from type=local,src=${CACHE_FILE} \
  --cache-to type=local,mode=max,dest=${CACHE_FILE}"
fi
docker buildx build $BUILD_PARAMS
if [ "$NEED_PUSH" = "1" ] ; then
    docker push --all-tags ${TAG_ALI_LATEST}
    docker push  --all-tags ${TAG_VERSION}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then 
        info_print "push to ${TAG_OFFICAL_LATEST}"
        docker push  --all-tags ${TAG_OFFICAL_LATEST}
        docker push  --all-tags ${TAG_OFFICAL_VERSION}
    fi    
fi

