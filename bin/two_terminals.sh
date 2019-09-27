#!/bin/sh
killall compton
i3-msg [workspace="1:"] kill
sleep 0.1
i3-msg append_layout ~/.i3/workspace-two.json
sleep 0.1
nohup alacritty &>/dev/null &
nohup alacritty -e sh -c "neofetch && zsh" &>/dev/null & 
sleep 0.2
nohup compton &>/dev/null &
