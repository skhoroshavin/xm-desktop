#!/bin/bash

common/common.sh

# Fix problem with Dell Inspiron 11 keyboard
cat <<EOF | sudo tee /etc/udev/hwdb.d/90-custom-keyboard.hwdb > /dev/null
evdev:atkbd:dmi:bvn*:bvr*:bd*:svnDell*:pnInspiron*3162:pvr*
 KEYBOARD_KEY_c7=!home
 KEYBOARD_KEY_cf=!end
 KEYBOARD_KEY_c9=!pageup
 KEYBOARD_KEY_d1=!pagedown
EOF

sudo snap remove snap-store
