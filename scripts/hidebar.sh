#!/bin/bash

if pgrep -x lemonbar >/dev/null 2>&1; then
    # barless mode
	pkill lemonbar
else
	./lemonbar.sh | lemonbar -n bar -B \#2e3440 -F \#d8dee9 -f 'SF Mono:size=10.8' -f 'JetBrains Mono:style=Italic:size=10.8' -f 'Victor Mono:style=SemiBold Italic:size=10.8' -f 'Noto Sans JP:size=10.8' -f 'mplus Nerd Font:style=Italic:size=10.8' -p -g 1920x30+0+0 | sh & 
fi

