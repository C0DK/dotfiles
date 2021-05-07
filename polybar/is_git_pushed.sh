#!/bin/sh
repos=""

issync() {
  cd $1
	if [ $(git status | grep "nothing to commit" | wc -c) -eq 0 ]
	then
		repos="$repos $(echo "$1" | sed 's/.*\///g')"
	fi
}

for file in ~/dev/*; do
	if [ -d "$file/.git" ]; then
	   issync "$file"
	fi
done

issync ~/.dotfiles
issync ~/.password-store

if [ ! -z "$repos" ]
then
	echo "$repos"
else
	echo ""
fi
