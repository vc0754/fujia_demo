#!/bin/bash
count=`ps -ef | grep 'KingdeeQueue' | grep -v  'grep' | wc -l`
if [ $count -lt 0 ]; then
   service th-kingdee-sync start
fi
count=`ps -ef | grep 'NoticeQueue' | grep -v  'grep' | wc -l`
if [ $count -lt 0 ]; then
   service th-notice-send start
fi
exit 0
