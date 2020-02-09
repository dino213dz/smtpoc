#!/bin/bash

target='mail.impb.ru'
to='test213dz@yopmail.com'
from='sbars@impb.ru'
subject='Test smtp.sh'
datas='example.txt'

script_path=$(echo "$0"|rev|cut -d "/" -f 2-)
cd $script_path
smtp.sh "$target" "$to" "$from" "$subject" "$datas"
cd $OLDPATH
exit
