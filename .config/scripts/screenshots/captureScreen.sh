#!/bin/bash

filepath="$HOME/Pictures/Screenshots/$(date +'%s_grim.png')"
grim -g "$(slurp -o)" - | tee "$filepath" | wl-copy -t image/png

play $HOME/.config/hypr/assets/sounds/camera-shutter.ogg