#!/bin/sh

kill $( ps ax | grep ssh | grep srce02 | awk '{ print $1 }' )
nmcli c down $( nmcli c | grep gsm | cut -d' ' -f1 )
grep default /tmp/ip.route | tail -1 | awk '{ print "sudo ip route add",$1,$2,$3 } ' | sh -x
