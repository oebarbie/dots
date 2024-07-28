#!/bin/bash

USER_DIR=/home/brb
DOTS_DIR=$USER_DIR/dots

foo () {
  rm -rf $USER_DIR/.config/$1
  ln -s $DOTS_DIR/$1 $USER_DIR/.config
}

# foo "berry"
foo "fish"
foo "helix"
foo "kitty"
foo "herbstluftwm"

# ln -sf $DOTS_DIR/vscode/settings.json $USER_DIR/.config/Code/User/
ln -sf $DOTS_DIR/x11/xinitrc $USER_DIR/.xinitrc

cp $DOTS_DIR/x11/*.conf /etc/X11/xorg.conf.d/

