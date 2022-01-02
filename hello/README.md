# node hello-world

基于父镜像 [registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest](../alinode)。运行此镜像的容器，支持通过环境变量 `APP_PORT` 来指定 http 服务的监听端口（默认为 8000）。

## 镜像 tag

registry.cn-hangzhou.aliyuncs.com/whyun/base:hello-latest

# hello-world 服务

基于上面的 hello-world 项目了，增加了服务注册功能。使用环境变量 `REGISTERED_HTTP_SERVICE_NAME`（默认hello-service） 和 `REGISTERED_HTTP_SERVICE_PORT`（默认 8000）。其他环境变量的使用可以参见项目 [consul-register](https://github.com/yunnysunny/consul-register)。

## 镜像 tag

registry.cn-hangzhou.aliyuncs.com/whyun/base:hello-service-latest