#!/bin/bash

ip_prefix="203.208"
tmp="/tmp/_.https.ip"

cd `dirname $0`

x=32
while [[ $x -lt 64 ]]; do
    y=0
    while [[ $y -lt 256 ]]; do
        ip="$ip_prefix.$x.$y"
        echo "Detecting $ip ... " >&2
        curl -m 1 https://$ip/ > /dev/null 2>$tmp
        err=`grep 'does not match target host name' $tmp`
        if [[ `echo $err | grep -v ^$ | wc -l` -gt 0 ]]; then
            dmn=`echo $err | sed "s#^[^']\+'\([^']\+\)'.\+#\1#g"`
            echo $ip $dmn >> ../build/google_ip-$ip_prefix
            echo
        fi
        let y=y+1
    done
    let x=x+1
done

