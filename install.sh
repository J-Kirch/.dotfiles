#!/usr/bin/env bash

bashrc="$HOME/.bashrc"
find $HOME -type l -iname ".bashrc" -delete
if [ -f "$bashrc" ]
then mv "$bashrc" "$bashrc.$(date +%H%M%S)"
fi

pushd $DOTFILES

for d in $(ls -d */); do (echo "stow $d" && stow -D $d && stow $d); done

source $bashrc
popd


