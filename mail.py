# -*- coding: utf-8 -*
import sys
import smtplib
from email.mime.text import MIMEText

mail_host = 'smtp.126.com'
mail_user = 'liuqinbin2'
mail_pass = 'L1q2q3123'
sender = 'liuqinbin2@126.com'
receivers = ['liu.chunping@shuweikeji.com','hu.liang@shuweikeji.com']
Warningtxt= sys.argv[1]

message = MIMEText(Warningtxt,'plain','utf-8')
message['Subject'] = '区块高度_数据异常！！！'
message['From'] = sender
message['To'] = receivers[0]

try:
    smtpObj = smtplib.SMTP()
    smtpObj.connect(mail_host,25)
    smtpObj.login(mail_user,mail_pass)
    smtpObj.sendmail(
        sender,receivers,message.as_string())
    smtpObj.quit()
    print('success')
except smtplib.SMTPException as e:
    print('error',e)
