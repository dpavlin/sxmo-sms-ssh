# sxmo - send sms to activate ssh remote port forwarding

First, let me start with a use case: I want to send sms from my phone to sim card
at remote location which will then bring up mobile network data and establish
remote ssh port forwarding to external host using new mobile connection so I can
log in back into network which lost it's connectivity with internet.

I spent way too much time trying to solve this, mostly because I didn't try
[sxmo](https://sxmo.org) which is exactly what I needed for this job.

## device

For device, I was fortunate than I had pinephone, one of 
[devices supported by postmarketos](https://wiki.postmarketos.org/wiki/Devices)

# postmarketos usb network setup

After plugging it in with usb cable, I configure usb network (which
changes device on every reboot of pinephone) with [pm-net.sh script](pm-net.sh)

Default password is **147147** which you will also need if you want to unlock device.

# find out sim card number

If you don't know phone number of this card, now you can
send test sms message to your number:
```
/usr/bin/sxmo_modemsendsms.sh +385912345678 "test sms"
```

# install modified hooks from this repository

It's simplest to just checkout this repository into home directory on device.

# sms hook

This hook is implemented in [.config/sxmo/hooks/sxmo_hook_sms.sh](.config/sxmo/hooks/sxmo_hook_sms.sh)

## create sms-ssh-number

This file will be used to verify numbers which are allowed to start ssh tunnel

```
# ssh into device
ssh user@172.16.42.1
echo "+385912345678 optional comment" >> sms-ssh-number
```

When sms with number in **sms-ssh-number** is received, it will start ssh tunnel using
[srce02-up.sh](srce02-up.sh)

## see log of sms messages

This hook will also save all sms messages in file on device (which you can than backup)

```
tail -f ~/.local/state/sms.txt
```

# see all device logs

There is also more elaborate [logread.sh](logread.sh) script tails all
logs on device together for monitoring.

# battery

Battery monitoring is implemented in
[.config/sxmo/hooks/sxmo_hook_statusbar.sh](.config/sxmo/hooks/sxmo_hook_statusbar.sh)

to see graphs for voltage and current of battery run following from xterm:

```
ssh user@172.16.42.1 ./battery.gnuplot
```

or

```
xterm -e 'ssh user@172.16.42.1 ./battery.gnuplot ; read'
```

To see last 10 minutes of battery usage:

```
pine64-pinephone:~$ tail ~/.local/state/battery.log
```

