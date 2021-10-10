FROM centos:7

LABEL maintainer="yunnysunny@gmail.com"
ENV PATH $PATH:/usr/local/go/bin
ENV GO111MODULE on
ENV GOPROXY https://goproxy.cn,direct
ARG GOPRIVATE
ENV GOPRIVATE "${GOPRIVATE}"
ENV TZ Asia/Shanghai


# 安装依赖
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
COPY etc/yum.repos.d /etc/yum.repos.d
RUN yum install -y epel-release
RUN yum install git gcc gcc-c++ make telnet wget ca-certificates -y
RUN git config --global url."git@${GOPRIVATE}:".insteadOf "https://${GOPRIVATE}"
COPY root/.ssh /root/.ssh
RUN ssh-keyscan -t rsa gitlab.com >> /root/.ssh/known_hosts
RUN chmod 600 /root/.ssh/*

# 安装go
ARG GO_VERSION
RUN wget https://mirrors.ustc.edu.cn/golang/go${GO_VERSION}.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
