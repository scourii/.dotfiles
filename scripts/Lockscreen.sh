#!/bin/bash
# Starts mantablockscreen and pauses dunst to prevent missed notifications

fg_color="6c605aff"

i3lock -e -f \
	--color=5e81ac \
	--insidevercolor=8fbcbb --insidewrongcolor=bf616a --insidecolor=8fbcbb \
	--ringvercolor=8fbcbb --ringwrongcolor=bf616a --ringcolor=8fbcbb \
	--keyhlcolor=ebcb8b --bshlcolor=cd9c85ff --separatorcolor=c8c2bfff \
	--line-uses-inside --verifcolor=eceff4 --wrongcolor=eceff4 \
	--indpos="w/2:h/2+80" --timepos="w/2:h/2-300" --datepos="w/2:h/2-240" --greeterpos="w/2:h/2-100" \
	--greetertext="Enter Password" --greetersize=25 --greeter-font="Victor Mono:style=italic" \
	--veriftext="checking" --wrongtext="incorrect!" \
	--verif-font="Victor Mono:style=italic" --wrong-font="Victor Mono:style=italic,bold" \
	--verifsize=23 --wrongsize=23 \
	--radius 80 --ring-width 6 \
	--timestr="%l:%M %P" --timesize=110 \
	--datestr="%a, %b %d" --datesize=40 \
	--clock --date-font="Victor Mono:style=italic" --time-font="SFMono Nerd Font:style=bold" \
	--datecolor=d8dee9 --timecolor=d8dee9 --greetercolor=d8dee9 \
	--pass-media-keys --pass-screen-keys --pass-power-keys --pass-volume-keys


