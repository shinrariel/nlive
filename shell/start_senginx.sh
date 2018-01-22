#!/bin/bash
echo "Starting SENginX"
cd /root/soft/senginx/sbin
nohup ./nginx &
while true;
do sleep 1;
done;