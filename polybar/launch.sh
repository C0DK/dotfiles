#!/bin/sh
if ! pgrep -x polybar; then
	polybar base &
else
	pkill -USR1 polybar
fi

echo "Bars launched..."
