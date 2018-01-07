#!/bin/bash
cd /root/soft/senginx/sbin
nohup ./nginx &
while true;
do sleep 1;
done;