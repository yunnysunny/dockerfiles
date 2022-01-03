#!/bin/bash
set -e

TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:hello-latest
TAG_OFFICAL_LATEST=yunnysunny/hello
SAVE_NAME=hello
. "$(dirname "$PWD")/util/docker_cache.sh"
load_cache $SAVE_NAME

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest
docker build ./docker -f ./hello.Dockerfile -t ${TAG_ALI_LATEST} -t ${TAG_OFFICAL_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then 
        info_print "push to ${TAG_OFFICAL_LATEST}";
        docker push ${TAG_OFFICAL_LATEST};    
    fi
fi

SERVICE_TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:hello-service-latest
SERVICE_TAG_OFFICAL_LATEST=yunnysunny/hello-service

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:hello-latest
docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:golang-latest
docker build ./hello-service -f ./hello-service.Dockerfile -t ${SERVICE_TAG_ALI_LATEST} -t ${SERVICE_TAG_OFFICAL_LATEST} --progress=plain
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${SERVICE_TAG_ALI_LATEST}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then docker push ${SERVICE_TAG_OFFICAL_LATEST}; fi
fi

save_cache $SAVE_NAME ${TAG_ALI_LATEST} ${TAG_OFFICAL_LATEST} ${SERVICE_TAG_ALI_LATEST} ${SERVICE_TAG_OFFICAL_LATEST}