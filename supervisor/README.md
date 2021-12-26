# supervisor

dockerfile 支持构建基于 centos 和 ubuntu 两个系统的版本，前者父镜像为 centos:7，后者父镜像为 ubuntu:latest。

supervisor 的配置目录为 `/etc/supervisor.d`，在其目录下的 .ini 后缀的文件会在系统启动的时候被 supervisor 读取。

目录 `/data/supervisor/log/` 配置了 logrotate 日志拆分功能，其下的 .log 文件会被按照日期拆分，推荐应用的日志放置到这个目录中。

目录 `/app.init.d` 目录下的 .sh 文件，会在系统启动的时候自动运行。

## 镜像 tag

registry.cn-hangzhou.aliyuncs.com/whyun/base:supervisor-latest

registry.cn-hangzhou.aliyuncs.com/whyun/base:supervisor-ubuntu-latest

