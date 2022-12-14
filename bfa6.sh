#!/bin/bash

. functions.sh

SD="$(sed -r 's/%2[Cc]/,/g' <<<"$1" | sed -r 's/%2[Aa]/*/g')"

IPV=6
curl -6sko /dev/null https://api.bilibili.com 2> /dev/null || IPV=4

MID=$(mymid)

if [ "x$MID" == "x" ]; then
    echo SESSDATA失效或请求被拦截
    exit 1
fi

PN=1
CNT=0

echo "MID=$MID"
FLCNT=$(followings | ./JSON.sh/JSON.sh -l | awk '/^\["data","total"\]/{print $2}')
echo "关注数 $FLCNT"
echo --------

while [ $CNT -lt $FLCNT ]; do
    followings |
        ./JSON.sh/JSON.sh -l |
        grep -E '\["data","list",[0-9]+,"(attribute|uname|sign)"' |
        sed -r 's/^\["data","list",//g' |
        sed -r 's/,"(.+)"\]\s+/\t\1\t/g' |
        awk -F'\t' -f followings.awk
    CNT=$((CNT + 20))
    PN=$((PN + 1))
done
