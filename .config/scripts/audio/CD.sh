#!/bin/bash

pactl load-module module-loopback \
  source="alsa_input.usb-KTMicro_KT-USB-Audio_KT0712_v3-2020-06-16-00-00-00.iec958-stereo" \
  sink="alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y8V5XC82847243-00.Direct__Direct__sink" \
  latency_msec=50

