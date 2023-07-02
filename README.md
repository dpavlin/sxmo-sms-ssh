# sxmo - send sms to activate ssh remote port forwarding

First, let me start with a use case: I want to send sms from my phone to sim card
at remote location which will then bring up mobile network data and establish
remote ssh port forwarding to external host using new mobile connection so I can
log in back into network which lost it's connectivity with internet.

I spent way too much time trying to solve this, mostly because I didn't try
[sxmo](https://sxmo.org) which is exactly what I needed for this job.

## device

For device, I was fortunate than I had pinephone, one of 
devices supported by postmarketos](https://wiki.postmarketos.org/wiki/Devices)

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

