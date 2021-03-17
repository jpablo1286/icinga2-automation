#!/bin/bash
yumcount=`ps aux | grep yum | wc -l`
while [ $yumcount -gt 1 ]
do
kill -9 `ps aux | grep yum | grep upgrade | head -1 | awk '{ print $2 }'` || true
sleep 5s
yumcount=`ps aux | grep yum | wc -l`
done