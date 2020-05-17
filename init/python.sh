#!/bin/bash -e

source ../.pathrc


# http://qiita.com/Kodaira_/items/feadfef9add468e3a85b
echo ">>> Installing pyenv" && {
	if [ -e $PYENV_PATH ]; then
		echo "Already exist $PYENV_PATH. Updating to the latest version."
		cd "$PYENV_PATH"
		git fetch --tags origin
		git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
	else
	    echo "Installing into $PYENV_PATH"
	    git clone https://github.com/pyenv/pyenv.git $PYENV_PATH
	    cd $PYENV_PATH
		git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
	
	    export PATH=$PYENV_PATH/bin:$PATH
	    eval "$(pyenv init -)"
	
	    echo "Installed!"
	fi
}

# https://pipxproject.github.io/pipx/installation/
echo ">>> Installing pipx" && {
	python3 -m pip install --user pipx
}
