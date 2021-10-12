FROM centos:7 as base

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
COPY docker/etc/yum.repos.d /etc/yum.repos.d
RUN yum install epel-release -y
RUN yum install wget curl make tcpdump net-tools bind-utils telnet python ca-certificates -y

RUN curl "https://bootstrap.pypa.io/pip/2.7/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
RUN pip install supervisor

