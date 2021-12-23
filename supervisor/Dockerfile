ARG IMAGE_NAME
FROM ${IMAGE_NAME}

COPY docker/tmp/dep_install.sh /tmp/
ARG IMAGE_TYPE
RUN /tmp/dep_install.sh

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
ARG CRON_START_OPTION
ENV CRON_START_OPTION ${CRON_START_OPTION}

# 添加启动脚本
COPY docker/app_init.sh /
COPY docker/app.init.d  /app.init.d
COPY docker/entrypoint.sh /
RUN mkdir -p /data/supervisor/log/
ENTRYPOINT [ "/entrypoint.sh" ]