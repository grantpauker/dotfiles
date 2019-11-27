#!/usr/bin/env bash
xrdb -merge -I$HOME ~/.Xresources
exec i3
