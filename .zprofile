export PATH=/home/stefan/.local/bin:/home/stefan/bin:$PATH

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
