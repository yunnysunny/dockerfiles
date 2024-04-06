FROM yunnysunny/ubuntu
RUN apt-get update \
  && apt-get --no-install-recommends  install curl ca-certificates -y \
  && apt-get clean \
  && rm /var/lib/apt/lists/* -rf 
  
ARG NODE_VERSION=10.24.1
ARG NPM_REGISTRY=https://registry.npmmirror.com
ARG NPM_MIRROR=https://npmmirror.com
ARG TARGETARCH
RUN if [ "$TARGETARCH" = "arm64" ] ; then \
    export ARCH=arm64 ; \
  elif [ "$TARGETARCH" = "arm" ] ; then \
    export ARCH=armv7l ; \
  else \
    export ARCH=x64 ; \
  fi ; \
  if [ "$TARGETARCH" = "arm64" ] || [ "$TARGETARCH" = "arm" ] ; then \
    apt-get update \
    && apt-get install libatomic1 --no-install-recommends -y \
    && rm -rf /var/lib/apt/lists/* ; \
  fi \
  && curl -fsSLO --compressed "${NPM_MIRROR}/mirrors/node/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.gz" \
  && tar -zxvf "node-v$NODE_VERSION-linux-$ARCH.tar.gz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.gz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs