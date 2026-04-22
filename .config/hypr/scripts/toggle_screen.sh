if pgrep hypridle; then
	killall hypridle
	hyprctl dispatch dpms off
else
	hypridle &
	hyprctl dispatch dpms on
fi
