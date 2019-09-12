#!/bin/sh
killall compton
sleep 0.1
i3-msg append_layout ~/.i3/workspace-four.json
for i in {1..4}; do `nohup alacritty &>/dev/null &`; sleep 0.1; done 
sleep 0.2
nohup compton &>/dev/null &
