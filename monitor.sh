#!/bin/bash

# Enter the mail id from which you want to send the mail.
smid=sender@example.com

#Enter the mail ids which you want to send notifications.
tmid=reciver1@example.com,reciver2@example.com

#Enter the file name with its path. This file contain all WEB URL which u want to monitor.
mfile=/root/home/file-example.txt

while read line
do
a=`curl -sL -w "%{http_code}\n" "$line" -o /dev/null`
if [ $a != 200 ]
then
echo We find a Error code $a , for the URL: $line , Time : `date` | mail -s "Your Website is DOWN" -r $smid $tmid

fi 
done < "$mfile"
