#!/bin/bash

# node进程的启动文件，默认为：server.js
if [ -z "$APP" ]; then
    export APP=server.js
fi

# 保持容器持续执行的tail的文件，默认：/var/log/*.log
if [ -z "$TAILLOG" ]; then
    export TAILLOG=/var/log/*.log
fi

# Logs
pod_name=$(hostname)
mkdir -p /logs/${pod_name}
mkdir -p /data/${pod_name}
mkdir -p /monitor/${pod_name}

ln -s  /logs/${pod_name} logs
ln -s  /data/${pod_name} data

# 启动node服务
cd /usr/src/app
npm start

# 日志监听，保持容器持续运行不退出
# tail -f $TAILLOG
