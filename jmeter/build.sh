#!/bin/bash
set -e

TAG_ALI_LATEST=registry.cn-hangzhou.aliyuncs.com/whyun/base:jmeter-latest
TAG_OFFICAL_LATEST=yunnysunny/jmeter
JMETER_VERSION=5.4.1
SAVE_NAME=jmeter
. "$(dirname "$PWD")/util/docker_cache.sh"
load_cache $SAVE_NAME

docker pull registry.cn-hangzhou.aliyuncs.com/whyun/base:jdk11-latest
docker build ./docker -f ./jmeter.Dockerfile -t ${TAG_ALI_LATEST} -t ${TAG_OFFICAL_LATEST} --progress=plain  --build-arg JMETER_VERSION=${JMETER_VERSION}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_ALI_LATEST}
    if [ "$PUSH_TO_OFFICAL" = "1" ] ; then 
        info_print "push to ${TAG_OFFICAL_LATEST}";
        docker push ${TAG_OFFICAL_LATEST};    
    fi
fi

save_cache $SAVE_NAME ${TAG_ALI_LATEST} ${TAG_OFFICAL_LATEST}