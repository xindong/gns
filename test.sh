#!/bin/bash
cd `dirname $0`
dnsmasq -C build/dnsmasq.conf --test
