#!/bin/sh
lock() {
  PICTURE=/tmp/i3lock.png
  BLUR="5x4"

  sleep 1
  scrot -z $PICTURE
  convert $PICTURE -blur $BLUR $PICTURE
  i3lock -i $PICTURE
  rm $PICTURE
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
