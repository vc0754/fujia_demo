## 富佳物业系统-1
php think queue:listen --queue  KingdeeQueue
php think queue:listen --queue  NoticeQueue


#生成环境
php think queue:work --daemon --queue KingdeeQueue
#守护进程
nohup php think queue:work --daemon --queue KingdeeQueue > tianhuan.log 2>&1 &

#机器人
https://oapi.dingtalk.com/robot/send?access_token=cfeddc04281e2e3504e9e0ae004c2fb548501e0422eb7aa0ee0cec8b0f262f60

