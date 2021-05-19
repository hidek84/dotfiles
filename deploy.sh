#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOT_DIR=$HOME/.dotfiles

echo ">> Making symlink for dotfiles"
cd $SCRIPT_DIR
for f in .??*
do
    # Ignore unnecessary files
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    echo "Making a symlink for ${f}..."
    ln -snfv "$DOT_DIR/$f" "$HOME/$f"
done


echo ">> Installing prezto"
PREZTO_DIR="$HOME/.zprezto"
if [ ! -d "$PREZTO_DIR" ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "$PREZTO_DIR"
else
    cd $PREZTO_DIR
    git pull
    git submodule update --init --recursive
fi


echo ">> Changing default shell"
if [ "$SHELL" != "/bin/zsh" ]; then
    chsh -s /bin/zsh
else
    echo "Default shell is already zsh"
fi
