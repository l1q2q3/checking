#!/bin/bash

#变量
check_num_sh_path=/etc/zabbix/scripts/check-ethetc/check_num.sh
ethetcnum=$(sed -n '1p' /etc/zabbix/scripts/check-ethetc/check-ethetc-num.txt)
logpath=/etc/zabbix/scripts/check-ethetc
log=$logpath/check-ethetc.log
print_log=1 #1打印 0不打印
is_log=1 #1记录 0不记录 


#动态时间
datef(){
date "+%Y-%m-%d %H:%M:%S"
}

#打印日志 
print_log(){
if [[ $is_log -eq 1 ]]
then
[[ -d $logpath ]] || mkdir -p $logpath

echo "[ $(datef) ] $1" >> $log
fi
if [[ $print_log -eq 1 ]]
then
echo "[ $(datef) ] $1" 
fi
}
