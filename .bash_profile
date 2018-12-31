export PATH=$HOME/.homebrew/bin:$PATH
export HOMEBREW_CACHE=$HOME/.homebrew/cache

export DOT_DIR=.dotfiles

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Alias
source ~/$DOT_DIR/shell/alias_common.sh
source ~/$DOT_DIR/shell/alias_private.sh

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
 	eval "$(pyenv init -)"
fi

# nvm
source ~/.nvm/nvm.sh
