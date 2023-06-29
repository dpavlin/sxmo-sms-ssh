tail -f .local/state/sxmo.log
logread -f | grep -v -E '(daemon.debug|authpriv.info)'
