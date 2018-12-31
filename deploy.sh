#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOT_DIR=$HOME/.dotfiles

echo "Making symlink for dotfiles"
cd $SCRIPT_DIR
for f in .??*
do
    # Ignore unnecessary files
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".DS_Store" ] && continue

    ln -snfv "$DOT_DIR/$f" "$HOME/$f"
done