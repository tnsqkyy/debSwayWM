#!/bin/bash

# Determine the directory of the current script to find other scripts relative to it.
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

exec swayidle -w \
    timeout 300 "exec $SCRIPT_DIR/swaylock.sh" \
    timeout 600 'swaymsg "output * power off"' \
    timeout 900 'systemctl suspend' \
    before-sleep "exec $SCRIPT_DIR/swaylock.sh" \

    lock "exec $SCRIPT_DIR/swaylock.sh"
