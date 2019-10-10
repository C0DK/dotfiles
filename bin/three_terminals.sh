#!/bin/sh
killall compton
sleep 0.1
i3-msg append_layout ~/.i3/workspace-three.json
sleep 0.2
nohup alacritty -e sh -c "neofetch && zsh" &>/dev/null & 
nohup alacritty &>/dev/null &
nohup alacritty &>/dev/null &
sleep 0.4
nohup compton &>/dev/null &
