FROM registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest

RUN wget -O- https://gitee.com/cik/tnvm/raw/master/install.sh | bash
ARG ALINODE_VERSION
ENV ALINODE_VERSION v${ALINODE_VERSION}
ENV TNVM_DIR /root/.tnvm
RUN source /root/.bashrc \
  && tnvm install alinode-$ALINODE_VERSION \
  && tnvm use alinode-$ALINODE_VERSION \
  && npm install @alicloud/agenthub yarn pm2 -g --registry=https://registry.npmmirror.com \
  && npm config set registry https://registry.npmmirror.com \
  && yarn config set registry https://registry.npmmirror.com \
	&& npm config set grpc-node-binary-host-mirror https://npmmirror.com/mirrors \
	&& npm config set profiler-binary-host-mirror https://npmmirror.com/mirrors/node-inspector/ \
  && npm config set disturl https://npmmirror.com/dist

ENV PATH $TNVM_DIR/versions/alinode/$ALINODE_VERSION/bin:$PATH
ENV ENABLE_NODE_LOG YES
RUN mkdir -p /data/alinode
ENV NODE_LOG_DIR /data/alinode

ENTRYPOINT [ "/entrypoint.sh" ]
COPY . /
