FROM registry.cn-hangzhou.aliyuncs.com/whyun/base:jdk11-latest

WORKDIR /opt
ARG JMETER_VERSION
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -zxvf apache-jmeter-${JMETER_VERSION}.tgz && \
    rm -rf apache-jmeter-${JMETER_VERSION}.tgz
COPY . /
ENTRYPOINT [ "/entrypoint.sh" ]
