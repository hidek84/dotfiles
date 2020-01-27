#!/bin/bash -ex

# https://qiita.com/ffggss/items/94f1c4c5d311db2ec71a

source .pathrc

### Install or Update nvm
if [ -e $NVM_PATH ]; then
	echo "Already exist $NVM_PATH."
	echo "Updating to the latest version."
	cd "$NVM_PATH"
	git fetch --tags origin
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
else
	echo "Installing into $NVM_PATH"
	git clone https://github.com/creationix/nvm.git "$NVM_PATH"
	cd "$NVM_PATH"
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
fi

. "$NVM_PATH/nvm.sh"

### Install or Update Node.js
nvm install --lts
nvm alias default lts/*
