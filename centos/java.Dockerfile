FROM registry.cn-hangzhou.aliyuncs.com/whyun/base:centos-latest

RUN yum install java-11-openjdk-devel -y  && yum clean all && rm -rf /var/cache/yum