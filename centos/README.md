# centos 镜像
父镜像基于 centos:7 , 将默认的 yum 源切换为网易源。同时安装了 telnet tcpdump logrotate ca-certificates 等常用包。默认时区改为东八区。具体参见 [second.Dockerfile](second.Dockerfile)。

## 镜像 tag

registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest

# java 镜像

基于上面的 centos 镜像，增加了 jdk11 包。

## 镜像 tag

registry.cn-hangzhou.aliyuncs.com/whyun/base:jdk11-latest