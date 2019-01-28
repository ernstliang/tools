# CentOS7安装配置
## U盘安装
### U盘安装盘制作
- 使用UltraISO来制作U盘启动需新版9.6及以上，软件注册码:网上搜索
- 打开UltraISO -> 文件 -> iso文件 -> 点"启动" -> 写入硬盘镜像，写入方式默认USB-HDD+,格式化，写入
### U盘安装遇到的问题
错误: dracut-initqueue timeout
原因: centos7找不到u盘启动盘，需要手动指定
解决方法:

```  
dracut:/# cd /dev
dracut:/# ls
查看所有设备，找到sda(x)或sdb(x)，x是u盘所在，比如我这是sda4，记住这个设备
dracut:/# reboot
重启设备后在install centos7页面按e键
修改vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=CentOS\x207\x20x86_64.check quiet
为
vmlinuz initrd=initrd.img inst.stage2=hd:/dev/sdbx(你u盘所在)quiet
然后按Ctrl+x保存
```


## CentOS配置
### 开启网络
centos安装完成后默认是没有开启网络的<br>
### 查看网络信息

```
ip addr show
```

例如我的网卡信息是:
- lo
- eno1
- wlo1

#### 修改网卡配置
网卡配置文件目录: `/etc/sysconfig/network-scripts`
进入目录并查看eno1对应网卡配置信息

```
cat ifcfg-eno1
```

修改ifcfg-eno1配置: 

```
ONBOOT=no => ONBOOT=yes  //开机启动网卡
```

手动重启网络:

```
systemctl restart network
```

#### 固定ip
//TODO

### 更新CentOS7的软件源
centos自带的yum源为国外地址，常常无法正常更新和安装
#### 下载国内yum源
国内大多使用网易或阿里云的yum源

```
http://mirrors.163.com/.help/CentOS7-Base-163.repo
http://mirrors.aliyun.com/repo/Centos-7.repo
```

#### 更新yum源

```
先备份yum源文件:
mv /etc/yum.repos.d/CentOS-Base.repo CentOS-Base.repo.bak

下载yum源或先下载通过u盘工具等拷贝:
wget http://mirrors.aliyun.com/repo/Centos-7.repo

替换yum源:
mv CentOS7.repo CentOS-Base.repo

执行更新yum源:
yum makecache
```

## 安装软件

```
yum install -y git vim zsh

安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## 关闭防火墙及开机自启

```
systemctl stop firewalld.service
```

```
[root@localhost ~]# systemctl disable firewalld.service 
Removed symlink /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service.
Removed symlink /etc/systemd/system/basic.target.wants/firewalld.service.
```

## 查看SeLinux状态

```
sestatus
```

## 临时关闭Selinux

```
setenforce 0
```

## 永久关闭SeLinux，需要重启机器

```
修改配置文件/etc/selinux/config，将SELINU置为disabled
```