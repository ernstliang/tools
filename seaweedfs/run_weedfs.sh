#!/bin/bash

nohup weed master -defaultReplication="001" > nohup.out 2>&1 &
nohup weed volume -dir="/data/volume/data" -max=5 -mserver="132.232.86.146:9333" -port=18080 -ip="132.232.86.146" > nohup.out 2>&1 &
nohup weed volume -dir="/data/volume/data2" -max=5 -mserver="132.232.86.146:9333" -port=18081 -ip="132.232.86.146" > nohup.out 2>&1 &
nohup weed volume -dir="/data/volume/data3" -max=5 -mserver="132.232.86.146:9333" -port=18082 -ip="132.232.86.146" > nohup.out 2>&1 &
