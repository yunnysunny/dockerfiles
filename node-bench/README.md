# http 压力测试

基于父镜像 [registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest](../alinode)。运行此镜像的容器可以通过环境变量 `REQ_INTERVAL_MS` 来指定请求发送的时间间隔（默认 10）；可以通过 `HTTP_POOL_SIZE` 来控制 http 1.1 的 keep-alive 连接池的句柄个数，默认不启用 http 1.1；环境变量 `REQ_TIMEOUT_MS` 来控制请求的超时时间，默认不超时。

## 镜像 tag

registry.cn-hangzhou.aliyuncs.com/whyun/base:node-bench-latest

registry.cn-hangzhou.aliyuncs.com/whyun/base:node-bench-${VERSION}