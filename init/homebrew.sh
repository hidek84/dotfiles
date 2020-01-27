source .pathrc

if [ -e $BREW_PATH ]; then
	echo "Already exist $BREW_PATH."
else
    echo "Installing into $BREW_PATH"
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $BREW_PATH

    echo "Installed!"
fi
