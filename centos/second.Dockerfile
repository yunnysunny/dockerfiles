FROM centos:7 as base

# 更改 yum 源
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
COPY docker/etc/yum.repos.d /etc/yum.repos.d
RUN sed -i -e '/plugins=1/d' -e '/plugins=0/d' /etc/yum.conf

RUN yum install epel-release -y && yum clean all && rm -rf /var/cache/yum
RUN yum install wget curl make tcpdump net-tools bind-utils telnet \
    logrotate ca-certificates which crontabs -y && yum clean all && rm -rf /var/cache/yum