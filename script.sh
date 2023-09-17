#!/bin/bash

USER_DIR=/home/brb
DOTS_DIR=$USER_DIR/dots

rm -rf $USER_DIR/.config/berry
ln -s $DOTS_DIR/berry $USER_DIR/.config/

rm -rf $USER_DIR/.config/fish
ln -s $DOTS_DIR/fish $USER_DIR/.config/

rm -rf $USER_DIR/.config/helix
ln -s $DOTS_DIR/helix $USER_DIR/.config/

rm -rf $USER_DIR/.config/kitty
ln -s $DOTS_DIR/kitty $USER_DIR/.config

ln -sf $DOTS_DIR/vscode/settings.json $USER_DIR/.config/Code/User/
ln -sf $DOTS_DIR/x11/.xinitrc $USER_DIR/

cp $DOTS_DIR/x11/30-touchpad.conf /etc/X11/xorg.conf.d/

