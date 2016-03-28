#!/bin/sh

DIR=$(cd "$(dirname $0)"; pwd)
TMUX_VERSION=$(tmux -V | cut -d ' ' -f2)
OS_NAME=$(uname -s | tr '[:upper:]' '[:lower:]')
CONFIG=".tmux.conf"
BASE_CONFIG=".tmux.base.conf"
VERSION_CONFIG=".tmux.$TMUX_VERSION.conf"
OS_CONFIG=".tmux.$OS_NAME.conf"
FILES="$CONFIG"

# build .tmux.conf by including any version an OS specific files
cat $DIR/$BASE_CONFIG > $DIR/$CONFIG
if [ -f "$DIR/$VERSION_CONFIG" ]; then
	cat $DIR/$VERSION_CONFIG >> $DIR/$CONFIG
fi
if [ -f "$DIR/$OS_CONFIG" ]; then
	cat $DIR/$OS_CONFIG >> $DIR/$CONFIG
fi

for file in $FILES; do
	 ln -siFn $DIR/$file $HOME/$file
done

