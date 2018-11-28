#!/bin/bash
# 需要管理员权限运行

#下载慢直接使用本地文件
#wget http://repo.mysql.com/mysql57-community-release-el7-10.noarch.rpm

#安装软件源
rpm -Uvh mysql57-community-release-el7-10.noarch.rpm

#安装mysql服务端
yum install -y mysql-community-server

#启动mysql
service mysqld start

#查看mysql运行状态
service mysqld status

#查看root临时密码
grep 'temporary password' /var/log/mysqld.log

#使用默认密码登陆
mysql -uroot -p

#修改密码
# mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
# 密码太简单会有错误提示
# 需要设置以下参数
# mysql> set global validate_password_policy=0;
# mysql> set global validate_password_length=1;
# 再次修改密码

#授权其他机器登陆
# mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'yourpassword' WITH GRANT OPTION;
#刷新
# mysql> FLUSH  PRIVILEGES;