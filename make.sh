#!/bin/bash

cd `dirname $0`

build="build/dnsmasq.conf"

echo > $build

echo "resolv-file=/etc/dnsmasq.resolv" >> $build
echo "addn-hosts=/etc/dnsmasq.hosts" >> $build

cat conf/gns.*.conf >> $build

