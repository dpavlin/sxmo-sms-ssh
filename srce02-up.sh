#!/bin/sh

# /etc/sudoers.d/user
#  user    ALL=NOPASSWD: ALL
sudo ip route del default

nmcli c up Default

while ! ping -c 3 srce02.net.ffzg.hr ; do
	sleep 1
done

ssh -N -v -R 22022:localhost:22 dpavlin@srce02.net.ffzg.hr &
SSH_PID=$!
echo $SSH_PID | tee /tmp/ssh.pid | logger
