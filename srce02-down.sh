kill $( ps ax | grep ssh | grep srce02 | awk '{ print $1 }' )
nmcli c down $( nmcli c | grep gsm | cut -d' ' -f1 )
