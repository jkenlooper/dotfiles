#!/bin/bash
# Taken from:
#	https://raw.github.com/kaihendry/Kai-s--HOME/master/.xinitrc
#
# for terminus font in Archlinux :(
xset +fp /usr/share/fonts/local
xset fp rehash

xset -b # disable bell

# Fast keyboard rate
xset r rate 200 30

xrdb -merge $HOME/.Xresources

exec /home/jake/bin/startdwm
