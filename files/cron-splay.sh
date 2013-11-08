#!/bin/bash

minutes="`echo $[ 0x\`hostid\` ] | sed s/-//`"
let "minutes %= 360"

for type in daily weekly monthly; do
    hour="`expr $minutes / 60`"
    minute="`expr $minutes % 60`"
    sed -ri "s@^([0-9]{1,2}) [^\*]{1,2}([ \t].*cron\.${type})@$minute $hour\2@" /etc/crontab
    minutes="`expr $minutes + 20`"
done
