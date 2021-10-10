FROM openjdk:11

COPY install_zk.sh /data/install_zk.sh
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install wget -y
ARG ZOOKEEPER_VERSION
RUN /data/install_zk.sh

CMD ["/opt/zookeeper/bin/zkServer.sh", "start-foreground"]
