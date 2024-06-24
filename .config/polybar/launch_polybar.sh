if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload haelnorr &
    done
else
    polybar --reload haelnorr &
fi
