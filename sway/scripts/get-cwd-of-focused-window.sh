#!/usr/bin/env bash
#
# This scripts prints the current working directory of the focused window
#

# Get the PID of the focused window (which is a terminal)
focused_window_pid=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.type=="con") | select(.focused==true).pid')

# Get the PID of the focused window's newest child process (which is a shell)
shell_pid=$(pgrep --newest --parent $focused_window_pid)

# Reads (which prints) the symbolic link to the shell's CWD
readlink -f /proc/$shell_pid/cwd || echo $HOME
