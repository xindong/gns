#!/bin/bash

cd `dirname $0`

build="build/dnsmasq.conf"

echo -n > $build

echo "min-cache-ttl=600" >> $build
echo "resolv-file=/etc/dnsmasq.resolv" >> $build
echo "addn-hosts=/etc/dnsmasq.hosts" >> $build
echo "conf-dir=/etc/dnsmasq.d" >> $build
echo "log-queries" >> $build
echo "log-facility=local1" >> $build
echo "cache-size=20000" >> $build

echo >> $build

awk 1 conf/gns.*.conf >> $build
