# Prints the name of the monitor that contains the focused window

#! /usr/bin/env bash

swaymsg -r -t get_outputs | jq -j '.[] | select(.focused == true) | .name'
