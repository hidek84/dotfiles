#!/bin/bash -ex

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
	    echo "pyenv installed!"
	fi
}

echo ">>> Installing python" || {
	LATEST_VERSION=$(pyenv install --list | grep -v - | grep -v "a\|b" | tail -1)
	pyenv install $LATEST_VERSION
	pyenv global $LATEST_VERSION
}

echo ">>> Installing poetry" && {
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
}
