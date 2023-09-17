#!/bin/bash
#
# ~/.xinitrc

parcellite &
sxhkd -c $HOME/.config/berry/sxhkdrc &
exec berry
