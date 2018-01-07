#!/bin/bash
cd /root/soft/nginx/sbin
nohup ./nginx &
cd /root/soft/panel
nohup node server.js > /root/logs/node.log 2>&1
while true;
do sleep 1;
done;