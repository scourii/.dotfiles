current_audio="$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"

if [ "$current_audio" = "0" ]; then
        icon_name="/usr/share/icons/Papirus/16x16/panel/audio-volume-muted.svg"
    else
        if [ "$current_audio" -lt "30" ]; then
            icon_name="/usr/share/icons/Papirus/16x16/panel/audio-volume-low.svg"
        else
            if [ "$current_audio" -lt "70" ]; then
                icon_name="/usr/share/icons/Papirus/16x16/panel/audio-volume-medium.svg"
            else
                icon_name="/usr/share/icons/Papirus/16x16/panel/audio-volume-high.svg"
            fi
        fi
fi

notify-send "Volume: ${current_audio}%" -i ${icon_name} -h string:x-canonical-private-synchronous:anything

