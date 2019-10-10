#!/bin/sh
killall compton
i3-msg append_layout ~/.i3/workspace-four.json
sleep 0.1
nohup alacritty &>/dev/null &
nohup alacritty &>/dev/null &
nohup alacritty &>/dev/null &
nohup alacritty -e sh -c "neofetch && zsh" &>/dev/null & 
sleep 0.5
nohup compton &>/dev/null &
