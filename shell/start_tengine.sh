#!/bin/bash
cd /root/soft/tengine/sbin
nohup ./nginx &
while true;
do sleep 1;
done;