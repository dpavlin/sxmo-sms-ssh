#!/bin/sh -xe

# postmarketos network setup

dev=$( ip link | grep enx | cut -d: -f2 )
echo "## Using $dev"
sudo ifconfig $dev 172.16.42.2 netmask 255.255.255.0 up
ping -c 3 172.16.42.1 && ssh user@172.16.42.1
