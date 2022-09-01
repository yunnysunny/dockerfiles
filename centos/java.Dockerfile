FROM yunnysunny/centos

RUN yum install java-11-openjdk-devel -y  && yum clean all && rm -rf /var/cache/yum