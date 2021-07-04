# General configs
export DOT_DIR=$HOME/.dotfiles
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GIT_EDITOR=vim


# Important paths
source ~/.pathrc


# Load shells (alias, functions)
for file in `ls $DOT_DIR/shell/*.sh`
do
if [ -e "$file" ]; then
        echo "Loading $file"
        source $file
fi
done


#
## Homebrew
export PATH=$BREW_PATH/bin:$PATH
export HOMEBREW_CACHE=$BREW_PATH/cache

## pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

## poetry
export PATH=$HOME/.poetry/bin:$PATH

## nvm
source $NVM_PATH/nvm.sh


# PATH
export PATH="$PATH:$HOME/.local/bin"


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export PATH="$HOME/.poetry/bin:$PATH"
