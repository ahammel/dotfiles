#!/bin/bash

# Get the keybindings right:
xbindkeys
xmodmap ~/.xmodmap

# Set the background:
feh --bg-center ~/Downloads/wallpaper/arch_grey.jpg

# Middle-button + trackpoint = wheel emulation
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5

# Get system tray running:
conky | dzen2 -x 175 &
