#!/bin/sh

DIR=$(cd "$(dirname $0)"; pwd)
TMUX_VERSION=$(tmux -V | cut -d ' ' -f2)
CONFIG=".tmux.conf"
BASE_CONFIG=".tmux.base.conf"
VERSION_CONFIG=".tmux.$TMUX_VERSION.conf"
FILES="$CONFIG"

# build .tmux.conf by including any version specific files
cat $DIR/$BASE_CONFIG > $DIR/$CONFIG
if [ -f "$DIR/$VERSION_CONFIG" ]; then
	cat $DIR/$VERSION_CONFIG >> $DIR/$CONFIG
fi

for file in $FILES; do
	 ln -siFn $DIR/$file $HOME/$file
done

