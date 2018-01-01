#!/bin/bash
cd /root/soft/nginx-1.13.8/sbin
nohup ./nginx &
while true;
do sleep 1;
done;