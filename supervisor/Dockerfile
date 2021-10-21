FROM centos:7 as base

# 更改 yum 源
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
COPY docker/etc/yum.repos.d /etc/yum.repos.d
RUN sed -i -e '/plugins=1/d' -e '/plugins=0/d' /etc/yum.conf
#RUN yum clean all

RUN yum install epel-release -y && yum clean all && rm -rf /var/cache/yum
RUN yum install wget curl make tcpdump net-tools bind-utils telnet \
    python3 python3-pip logrotate ca-certificates which crontabs -y \
    && yum clean all \
    && rm -rf /var/cache/yum

# 安装 supervisor
COPY docker/root/.pip /root/.pip
RUN pip3 install supervisor
RUN mkdir -p /data/supervisor/log
COPY docker/etc/supervisord.conf /etc
COPY docker/etc/supervisor.d /etc/supervisor.d
# 配置 logrotate
COPY docker/etc/logrotate.d /etc/logrotate.d

# 使用东八区时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 必须添加这两个环境变量，否则 supervisor 无法在 python3 下启动
ENV LC_ALL "en_US.UTF-8"
ENV LANG "en_US.UTF-8"

# 添加启动脚本
COPY docker/app_init.sh /
COPY docker/app.init.d  /app.init.d
COPY docker/entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]