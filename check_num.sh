#!/bin/bash

ethetcnum=$(sed -n '1p' /etc/zabbix/scripts/check-ethetc/check-ethetc-num.txt)
python_ip=118.##
if [ $ethetcnum = 0 ]
then
    ssh root@$python_ip "python /opt/mail.py ${1}--数据异常"
    sleep 2
    echo '1' > /etc/zabbix/scripts/check-ethetc/number.txt
fi

exit


