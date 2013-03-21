#!/bin/bash

ip_prefix=$1
tmp="/tmp/_.https.ip"

cd `dirname $0`

i=0
while [[ $i -lt 256 ]]; do
    ip="$ip_prefix.$i"
    echo "Detecting $ip ... " >&2
    curl -m 1 https://$ip/ > /dev/null 2>$tmp
    err=`grep 'does not match target host name' $tmp`
    if [[ `echo $err | grep -v ^$ | wc -l` -gt 0 ]]; then
        dmn=`echo $err | sed "s#^[^']\+'\([^']\+\)'.\+#\1#g"`
        echo $ip $dmn >> ../build/google_ip-$ip_prefix
        echo
    fi
    let i=i+1
done
