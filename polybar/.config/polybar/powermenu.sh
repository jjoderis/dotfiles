#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Suspend\n  Hibernate\n  Lock" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Power Off") systemctl poweroff ;;
	"  Restart") systemctl reboot ;;
	"  Suspend") systemctl suspend-then-hibernate ;;
	"  Hibernate") systemctl hibernate ;;
	"  Lock") i3lock ;;
	*) exit 1 ;;
esac
