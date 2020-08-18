#!/bin/sh
if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
then
	echo ""
else
	echo " $(bluetoothctl info | grep "Name: " | sed 's/\W*Name://g')"
fi
