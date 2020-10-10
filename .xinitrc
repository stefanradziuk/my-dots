
#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# apply terminal emulator settings
xrdb -merge /home/stefan/.Xresources

# set a cursor (the default is left_ptr)
xsetroot -cursor_name rtl_logo

# configure the touchpad 
# migrated to /etc/X11/xorg.conf.d/30-touchpad.conf
# xinput set-prop 13 307 1
# xinput set-prop 13 315 1
# xinput set-prop 13 327 0.4

# migrated to /etc/X11/xorg.conf.d/00-keyboard.conf
# setxkbmap -layout gb,pl -option grp:ctrls_toggle

# set keyboard refresh rate
# migrated to /etc/X11/xinit/xserverrc
# xset r rate 400 25

xbindkeys -f /home/stefan/.xbindkeysrc

# feh --bg-max --randomize ~/wallpapers/stalenhag/*
# feh --bg-fill ~/pictures/wallpapers/jap/1.jpg &
~/.fehbg

# making the cursor invisible after 10 s of inactivity
unclutter --timeout 10 --ignore-scrolling &

# automatic 'tablet mode' switching
watch_tablet &

exec i3
# while :; do
#   dwm
# done
