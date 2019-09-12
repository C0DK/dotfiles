#!/bin/sh
killall compton
sleep 0.1
i3-msg append_layout ~/.i3/workspace-big.json
for i in {1..3}; do `nohup alacritty &>/dev/null &`; sleep 0.2; done 
sleep 0.2
nohup compton &>/dev/null &
