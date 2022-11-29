#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
killall -q glava
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if [ "$1" == "light" ]
then
	polybar -c $HOME/.config/polybar/light-config nord-top &
	polybar -c $HOME/.config/polybar/light-config nord-down &
	glava --desktop &
else
	polybar -c $HOME/.config/polybar/dark-config nord-top &
	polybar -c $HOME/.config/polybar/dark-config nord-down &
  glava --desktop &
fi

echo "Bars launched..."
