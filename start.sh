#!/usr/bin/env bash
#删除所有已经停止的容器
docker rm $(docker ps -a -q)
# 删除所有未打 dangling 标签的镜像
docker rmi $(docker images -q -f dangling=true)
docker-compose build
docker-compose down
docker-compose up -d
docker ps -a