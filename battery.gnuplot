#!/usr/bin/gnuplot

set terminal xterm

set timefmt "%Y-%m-%dT%H:%M:%S"
set xdata time

#set ylabel "current"
set y2tics 10 nomirror
#set ytics nomirror
set y2tics autofreq tc lt 1

plot '/home/user/.local/state/battery.log' \
	using 1:($3/1000) axis x1y1 title "mA" with points ps 0.7, \
	'/home/user/.local/state/battery.log' \
	using 1:($4/1000000) axis x1y2 title "V" with lines
