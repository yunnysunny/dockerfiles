FROM registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest

RUN mkdir -p /app
WORKDIR /app

CMD node cluster.js

COPY . /
