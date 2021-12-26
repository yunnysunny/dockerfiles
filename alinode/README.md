# alinode 基础镜像

父镜像基于 [registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest](../centos) ， tnvm 使用了国内托管在 gitee 上的开源项目 [cik/tnvm](https://gitee.com/cik/tnvm)，可以解决无法通过 github 安装 tnvm 的问题。同时镜像内部预装了 yarn ，并且将 npm 安装源设置为 https://registry.npmmirror.com 。

## 镜像 tag

registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-latest

registry.cn-hangzhou.aliyuncs.com/whyun/base:alinode-${ALINODE_VERSION}