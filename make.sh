#!/bin/bash

cd `dirname $0`

build="build/dnsmasq.conf"

echo -n > $build

echo "min-cache-ttl=600" >> $build
echo "resolv-file=/etc/dnsmasq.resolv" >> $build
echo "addn-hosts=/etc/dnsmasq.hosts" >> $build
echo "conf-dir=/etc/dnsmasq.d" >> $build
echo "all-servers" >> $build
echo "log-queries" >> $build
echo "log-facility=local1" >> $build
echo "port=5353" >> $build
echo "cache-size=2000000" >> $build
echo "dns-forward-max=15000" >> $build

echo >> $build

awk 1 conf/gns.*.conf >> $build
