#!/bin/sh
exec start-pulseaudio-x11 
[ -e ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources
[ -e ~/.fehbg ] && ~/.fehbg
[ -e ~/.compton.conf ] && compton --config ~/.compton.conf -b
exec i3
