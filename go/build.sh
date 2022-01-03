#!/bin/bash
set -e

GO_VERSION=1.17.2
GOPRIVATE=gitlab.com
TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:golang-latest
TAG_OFFICAL_LATEST=yunnysunny/golang
TAG_CURRENT=registry.cn-hangzhou.aliyuncs.com/whyun/base:golang-${GO_VERSION}
SAVE_NAME=go
. "$(dirname "$PWD")/util/docker_cache.sh"
load_cache $SAVE_NAME

docker pull centos:7
docker build . -f ./Dockerfile -t ${TAG_ALI_LATEST} -t ${TAG_OFFICAL_LATEST} -t ${TAG_CURRENT} \
    --build-arg GO_VERSION=${GO_VERSION} --build-arg GOPRIVATE=${GOPRIVATE}
if [ "$NEED_PUSH" = "1" ] ; then
    info_print "push to ${TAG_ALI_LATEST}"
    docker push ${TAG_ALI_LATEST}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then 
        info_print "push to ${TAG_OFFICAL_LATEST}";
        docker push ${TAG_OFFICAL_LATEST};    
    fi
    docker push ${TAG_CURRENT}
fi

save_cache $SAVE_NAME ${TAG_ALI_LATEST} ${TAG_OFFICAL_LATEST}