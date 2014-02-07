#!/bin/bash

cd `dirname $0`

build="build/dnsmasq.conf"

echo -n > $build

echo "resolv-file=/etc/dnsmasq.resolv" >> $build
echo "addn-hosts=/etc/dnsmasq.hosts" >> $build
echo >> $build

cat conf/gns.*.conf >> $build

