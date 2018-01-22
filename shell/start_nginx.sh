#!/bin/bash
echo "Starting NginX"
cd /root/soft/nginx/sbin
nohup ./nginx &
while true;
do sleep 1;
done;