#!/bin/bash -ex

# http://qiita.com/Kodaira_/items/feadfef9add468e3a85b

PYENV_PATH=~/.pyenv

if [ -e $PYENV_PATH ]; then
	echo "Already exist $PYENV_PATH."
	echo "Updating to the latest version."
	cd "$PYENV_PATH"
	git fetch --tags origin
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
else
    echo "Installing into $PYENV_PATH"
    git clone https://github.com/pyenv/pyenv.git $PYENV_PATH
    cd $PYENV_PATH
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`

    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"

    echo "Installed!"
fi
