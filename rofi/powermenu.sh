#!/usr/bin/env bash

rofi_command="rofi -theme powermenu.rasi -m -4"

# Options
shutdown=""
reboot="ﰇ"
#lock=""
suspend="⏾"
logout=""
hibernate=""

user=$(whoami)

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$hibernate\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"

case $chosen in
    $shutdown)
		answer=$(echo -e "no\nyes" | rofi -dmenu -i -no-fixed-num-lines -p " Shutdown now?" -theme ~/confirm.rasi)
		;;
    $reboot)
		answer=$(echo -e "no\nyes" | rofi -dmenu -i -no-fixed-num-lines -p "Reboot now?" -theme ~/confirm.rasi)
        ;;
#    $lock)
#        ;;
    $hibernate)
		answer=$(echo -e "no\nyes" | rofi -dmenu -i -no-fixed-num-lines -p "  Hibernate now?" -theme ~/confirm.rasi)
		;;
    $suspend)
		answer=$(echo -e "no\nyes" | rofi -dmenu -i -no-fixed-num-lines -p "⏾ Suspend now?" -theme ~/confirm.rasi)
        ;;
    $logout)
		answer=$(echo -e "no\nyes" | rofi -dmenu -i -no-fixed-num-lines -p "  Logout now?" -theme ~/confirm.rasi)
        ;;
esac

[[ ${answer,,} != yes ]] && exit 1

# XXX
### Modify to your system ###
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
#    $lock)
#	mantablockscreen
#        ;;
    $hibernate)
	systemctl hibernate
	;;
    $suspend)
        cmus-remote -u
        systemctl suspend
        ;;
    $logout)
        pkill -KILL -U $user
        ;;
esac
