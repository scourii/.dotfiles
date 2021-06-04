
caps="$(xset q | grep Caps | awk '{ print $NF=$4 }')"

if [[ "$caps" == "off" ]];
then
	output="Caps Lock is off"
else	
	output="Caps Lock is on"
fi

notify-send "$output"
