#!/bin/bash

/app_init.sh

"$@"
# 前台 启动 supervisor
exec supervisord -c /etc/supervisord.conf -n