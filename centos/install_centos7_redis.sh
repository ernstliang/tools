#!/bin/bash
#脚本使用sudo权限运行

# 安装rpm包
yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# 安装redis
yum --enablerepo=remi install -y redis

# 启动redis
systemctl start redis

# 查看redis的版本
redis-cli --version

# 设置开机启动
systemctl enable redis.service

# TODO:
# Redis开启远程登录连接，redis默认只能localhost访问，所以需要开启远程登录
# 在redis的配置文件/etc/redis.conf中
# 将bind 127.0.0.1 改成了 bind 0.0.0.0
# 然后要配置防火墙 开放端口6379

# Redis 3.2后新增protected-mode配置，默认是yes，即开启
# 1、设置 protected-mode 为 no
# 2、配置bind或者设置密码 requirepass => 'your password'

# 开启centos7 6379端口
# --permanent永久生效
firewall-cmd --zone=public --add-port=6379/tcp --permanent
# 重新载入配置
firewall-cmd --reload
# 查看端口状态
firewall-cmd --zone=public --query-port=6379/tcp