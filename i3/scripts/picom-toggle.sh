#!/bin/bash
if pgrep -x "picom" > /dev/null
then
	killall picom
else
	killall picom
	# picom -b --config ~/.config/i3/picom.conf
fi
