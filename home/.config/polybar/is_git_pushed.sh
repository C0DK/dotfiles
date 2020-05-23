#!/bin/sh

repos=""

isSync() {
	if [ $(git -C $1 status | grep "nothing to commit" | wc -c) -eq 0 ]
	then
		repos="$repos $(echo "$1" | sed 's/.*\///g')"
	fi
}

for file in ~/dev/*; do
	if [ -d "$file/.git" ]; then
	   isSync "$file"
	fi
done

isSync ~/.dotfiles
isSync ~/.password-store
isSync ~/Documents

if [ ! -z "$repos" ]
then
	echo "$repos"
else
	echo ""
fi

