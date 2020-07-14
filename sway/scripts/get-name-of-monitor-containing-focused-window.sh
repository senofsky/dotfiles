#!/usr/bin/env bash
#
# Prints the name of the monitor that contains the focused window
#

swaymsg -r -t get_outputs | jq -j '.[] | select(.focused == true) | .name'
