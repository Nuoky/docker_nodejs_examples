#!/bin/bash

# node进程的启动文件，默认为：server.js
if [ -z "$APP" ]; then
    export APP=server.js
fi

# 保持容器持续执行的tail的文件，默认：/var/log/*.log
if [ -z "$TAILLOG" ]; then
    export TAILLOG=/var/log/*.log
fi

cd /usr/src/app
# 启动node服务
npm start
# 日志监听，保持容器持续运行不退出
tail -f $TAILLOG
