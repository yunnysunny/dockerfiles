#!/bin/bash
set -e
# alinode 6.7.0 <=> node v14.18.1
ALINODE_VERSION=6.7.0
TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest
TAG_OFFICAL_LATEST=yunnysunny/alinode
TAG_VERSION=registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-${ALINODE_VERSION}

SAVE_NAME=alinode
. "$(dirname "$PWD")/util/docker_cache.sh"
load_cache $SAVE_NAME

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest
docker build ./docker -f ./alinode.Dockerfile -t ${TAG_ALI_LATEST} -t ${TAG_OFFICAL_LATEST} -t ${TAG_VERSION} --progress=plain \
  --build-arg ALINODE_VERSION=${ALINODE_VERSION}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then 
        info_print "push to ${TAG_OFFICAL_LATEST}";
        docker push ${TAG_OFFICAL_LATEST};    
    fi
    docker push ${TAG_VERSION}
fi
save_cache $SAVE_NAME ${TAG_ALI_LATEST} ${TAG_OFFICAL_LATEST}