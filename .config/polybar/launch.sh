#!/bin/bash

if pidof gnome-shell > /dev/null; then
  exit 1
fi

# TODO && behaviour?
killall -q polybar
polybar bot

# killall -q polybar && polybar bot

# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# echo "---" | tee -a /tmp/polybar_bot.log
# polybar bot >> /tmp/polybar_bot.log 2>&1 &

echo "Polybar launched"
