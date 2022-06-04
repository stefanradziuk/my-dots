#!/usr/bin/env bash
#
# rotate_desktop.sh
#
# Rotates modern Linux desktop screen and input devices to match. Handy for
# convertible notebooks. Call this script from panel launchers, keyboard
# shortcuts, or touch gesture bindings (xSwipe, touchegg, etc.).
#
# Using transformation matrix bits taken from:
#   https://wiki.ubuntu.com/X/InputCoordinateTransformation
#

# Configure these to match your hardware (names taken from `xinput` output).
TOUCHPAD='ETPS/2 Elantech Touchpad'
TOUCHSCREEN='Wacom Pen and multitouch sensor Finger'
PEN='Wacom Pen and multitouch sensor Pen Pen (0)'
PEN_2='Wacom Pen and multitouch sensor Pen Pen (0x9b0d329c)'
PEN_ERASER='Wacom Pen and multitouch sensor Pen Eraser (0x9b0d329c)'

if [ -z "$1" ]; then
  echo "Missing orientation."
  echo "Usage: $0 [normal|inverted|left|right] [revert_seconds]"
  echo
  exit 1
fi

function do_rotate
{
  xrandr --output "$1" --rotate "$2"

  TRANSFORM='Coordinate Transformation Matrix'

  case "$2" in
    normal)
      [ -n "$TOUCHPAD" ]    && xinput set-prop "$TOUCHPAD"    "$TRANSFORM" 1 0 0 0 1 0 0 0 1
      [ -n "$TOUCHSCREEN" ] && xinput set-prop "$TOUCHSCREEN" "$TRANSFORM" 1 0 0 0 1 0 0 0 1
      [ -n "$PEN" ]         && xinput set-prop "$PEN"         "$TRANSFORM" 1 0 0 0 1 0 0 0 1
      [ -n "$PEN_2" ]       && xinput set-prop "$PEN_2"       "$TRANSFORM" 1 0 0 0 1 0 0 0 1
      [ -n "$PEN_ERASER" ]  && xinput set-prop "$PEN_ERASER"  "$TRANSFORM" 1 0 0 0 1 0 0 0 1
      ;;
    inverted)
      [ -n "$TOUCHPAD" ]    && xinput set-prop "$TOUCHPAD"    "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
      [ -n "$TOUCHSCREEN" ] && xinput set-prop "$TOUCHSCREEN" "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
      [ -n "$PEN" ]         && xinput set-prop "$PEN"         "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
      [ -n "$PEN_2" ]       && xinput set-prop "$PEN_2"       "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
      [ -n "$PEN_ERASER" ]  && xinput set-prop "$PEN_ERASER"  "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
      ;;
    left)
      [ -n "$TOUCHPAD" ]    && xinput set-prop "$TOUCHPAD"    "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
      [ -n "$TOUCHSCREEN" ] && xinput set-prop "$TOUCHSCREEN" "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
      [ -n "$PEN" ]         && xinput set-prop "$PEN"         "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
      [ -n "$PEN_2" ]       && xinput set-prop "$PEN_2"       "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
      [ -n "$PEN_ERASER" ]  && xinput set-prop "$PEN_ERASER"  "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
      ;;
    right)
      [ -n "$TOUCHPAD" ]    && xinput set-prop "$TOUCHPAD"    "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
      [ -n "$TOUCHSCREEN" ] && xinput set-prop "$TOUCHSCREEN" "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
      [ -n "$PEN" ]         && xinput set-prop "$PEN"         "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
      [ -n "$PEN_2" ]       && xinput set-prop "$PEN_2"       "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
      [ -n "$PEN_ERASER" ]  && xinput set-prop "$PEN_ERASER"  "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
      ;;
  esac
}

XDISPLAY=$(xrandr --current | grep primary | sed --expression='s/ .*//g')
XROT=$(xrandr --current --verbose | grep primary | grep --extended-regexp --only-matching ' (normal|left|inverted|right) ')

do_rotate "$XDISPLAY" "$1"

if [ -n "$2" ]; then
  sleep "$2"
  do_rotate "$XDISPLAY" "$XROT"
  exit 0
fi
