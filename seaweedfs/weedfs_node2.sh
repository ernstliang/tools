#!/bin/bash

#节点
#node1 ip: 212.64.78.186
#node2 ip: 212.64.84.249
#node3 ip: 129.211.44.155
NODE1=212.64.78.186
NODE2=212.64.84.249
NODE3=129.211.44.155
#当前节点
NODE=$NODE2

#weed的文件路径
WEED=/data/industry/weedfs/weed
MDATA=/data/weedfs/master
VDATA=/data/weedfs/volume

#port
MPORT=9333
VPORT=18082

#创建目录
mkdir -p $MDATA
mkdir -p $VDATA

# -v=3 指定日志等级
#启动weed master服务
$WEED master -port=$MPORT -ip=$NODE -mdir=$MDATA -peers=$NODE1:$MPORT,$NODE3:$MPORT -defaultReplication=010 > nohup_master.log 2>&1 &

#启动weed volume服务
$WEED volume -port=$VPORT -ip=$NODE -dir=$VDATA -mserver=$NODE1:$MPORT -rack=rc2 > nohup_volume.log 2>&1 &
