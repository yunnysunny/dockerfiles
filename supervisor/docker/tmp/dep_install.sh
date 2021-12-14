#!/bin/bash
set -e

if [ $IMAGE_TYPE = "ubuntu" ] ; then
    sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
    apt-get update
    apt-get install  --no-install-recommends  wget curl make tcpdump net-tools \
        dnsutils telnet gnupg ca-certificates python3 python3-pip logrotate \
        cron -y
    rm -rf /var/lib/apt/lists/*
    ln -s /usr/sbin/cron /usr/sbin/crond
else
    # 更改 yum 源
    sed -e 's|^mirrorlist=|#mirrorlist=|g' \
        -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
        -i.bak \
        /etc/yum.repos.d/CentOS-*.repo
    sed -i -e '/plugins=1/d' -e '/plugins=0/d' /etc/yum.conf

    yum install epel-release -y
    yum install wget curl make tcpdump net-tools bind-utils telnet \
        python3 python3-pip logrotate ca-certificates which crontabs -y \
    yum clean all && rm -rf /var/cache/yum
fi