#!/bin/sh

repos=""

isSync() {
	if [ $(git -C $1 status | grep "nothing to commit" | wc -c) -eq 0 ]
	then
		repos="$repos $(echo "$1" | sed 's/.*\///g')"
	fi
}

isSync ~/.dotfiles
isSync ~/dev/ark36
isSync ~/dev/kbtui
isSync ~/dev/smalldickbot
isSync ~/dev/gitgut
isSync ~/itu/pcpp
isSync ~/itu/security
isSync ~/itu/algorithm_design/algdes-labs
isSync ~/itu/func_programming
isSync ~/Documents

if [ ! -z "$repos" ]
then
	echo "$repos"
else
	echo ""
fi

