# go 镜像

> 此镜像已经废弃，请移步到 https://github.com/yunnysunny/docker-golang 。

父镜像基于 centos:7，将 yum 镜像源切换为 centos:7，增加了 go 私有仓库的支持，具体可以参见博文 [go 私有化包构建路](https://blog.whyun.com/posts/go-private-package/)。

构建时传递的 GOPRIVATE 参数，代表你的托管 go 项目源码的私有 git 仓库域名。

## 镜像 tag

registry.cn-hangzhou.aliyuncs.com/whyun/base:golang-latest

registry.cn-hangzhou.aliyuncs.com/whyun/base:golang-${GO_VERSION}