tail -f $XDG_STATE_HOME/*.log
sudo logread -f | grep -v -E '(daemon.debug|authpriv.info)'
