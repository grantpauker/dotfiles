#!/bin/sh
start-pulseaudio-x11 
[ -e ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources
[ -e ~/.fehbg ] && source ~/.fehbg
[ -e ~/.compton.conf ] && compton --config ~/.compton.conf -b
i3
