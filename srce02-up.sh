#!/bin/sh

# /etc/sudoers.d/user
#  user    ALL=NOPASSWD: ALL
sudo ip route del default
# remove default route to ensure that our ssh will be over gsm connection

gsm_connection=$( nmcli c | grep gsm | cut -d' ' -f1 )
nmcli c up $gsm_connection

while ! ping -c 3 srce02.net.ffzg.hr ; do
	sleep 1
done

ssh -C -N -v -R 22022:localhost:22 dpavlin@srce02.net.ffzg.hr &
SSH_PID=$!
echo $SSH_PID | tee /tmp/ssh.pid | logger
