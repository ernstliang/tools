#!/bin/bash
# 安装autojump
# 依赖git(下载代码),python(安装/卸载)

#下载autojump源码
git clone git://github.com/joelthelion/autojump.git

# 进入目录
cd autojump

# 安装
./install.py

# 配置.bashrc文件

######################
# .bashrc

# Source global definitions
# if [ -f /etc/bashrc ]; then
# 	. /etc/bashrc
# fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
######################

echo "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh" >> ~/.bashrc

# 重新加载.bashrc
source ~/.bashrc

# 查看版本
autojump --version

