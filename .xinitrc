#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources

DEFAULT_SESSION=i3

case $1 in
wmii)
    exec wmii
    ;;
i3)
    xmodmap ~/.xmodmap
    xbindkeys
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
    xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5
    feh --bg-center ~/Downloads/wallpaper/arch_grey.jpg
    unclutter &
    exec i3 -V >> ~/.i3/i3log 2>&1
    ;;
*)
    exec $DEFAULT_SESSION
    ;;
esac
