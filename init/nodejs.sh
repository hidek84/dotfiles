#!/bin/bash -ex

# https://qiita.com/ffggss/items/94f1c4c5d311db2ec71a

export NVM_DIR="$HOME/.nvm"

### Install or Update nvm
if [ -e $NVM_DIR ]; then
	echo "Already exist $NVM_DIR."
	echo "Updating to the latest version."
	cd "$NVM_DIR"
	git fetch --tags origin
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
else
	echo "Installing into $NVM_DIR"
	git clone https://github.com/creationix/nvm.git "$NVM_DIR"
	cd "$NVM_DIR"
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
fi

. "$NVM_DIR/nvm.sh"

### Install or Update Node.js
nvm install --lts
nvm alias default lts/*
