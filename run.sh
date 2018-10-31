#!/bin/bash

#读取变量
. ./var.sh

#开始监控
print_log ""
print_log "开始监控eth etc..."

#第一次取新数据
. ./onedata.sh

#打印数据
print_log "ip 103 162 132 144 数据分别为: ${oldnum[0]} ${oldnum[1]} ${oldnum[2]} ${oldnum[3]}"

#转换进制
oldnum10=($((${oldnum[0]})) $((${oldnum[1]})) $((${oldnum[2]})) $((${oldnum[3]})))

print_log "等待30分钟..."
sleep 1800

#第二次取新数据
. ./twodata.sh

#打印数据
print_log "ip 103 162 132 144数据分别为: ${newnum[0]} ${newnum[1]} ${newnum[2]} ${newnum[3]}"

#转换进制
newnum10=($((${newnum[0]})) $((${newnum[1]})) $((${newnum[2]})) $((${newnum[3]})))

#判断新数据和旧数据
if [ ${newnum10[0]} -eq ${oldnum10[0]} ]
then
    print_log "172.31.95.103 数据异常->退出监控"
    $check_num_sh_path 172.31.95.103
sleep 2
elif [ ${newnum10[1]} -eq ${oldnum10[1]} ]
then
    print_log "172.31.95.162 数据异常->退出监控"
    $check_num_sh_path 172.31.95.162
sleep 2
elif [ ${newnum10[2]} -eq ${oldnum10[2]} ]
then
    print_log "172.31.95.132 数据异常->退出监控"
    $check_num_sh_path 172.31.95.132
elif [ ${newnum10[3]} -eq ${oldnum10[3]} ]
then
    print_log "172.31.95.144 数据异常->退出监控"
    $check_num_sh_path 172.31.95.144
else
    print_log "数据正常->退出监控"
    echo '0' > /etc/zabbix/scripts/check-ethetc/number.txt
fi

exit
