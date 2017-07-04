#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
    for file in (
        ".aliases",
        ".bash_profile",
        ".bash_prompt",
        ".bashrc",
        ".curlrc",
        ".editorconfig",
        ".exports",
        ".functions",
        ".gdbinit",
        # ".gvimrc" # not finished yet
        ".pylintrc",
        ".screenrc",
        ".tmux.conf",
        ".zshrc",
    )
    if [[ -f "~/$file" || -L "~/$file" ]]; then
        mv "~/$file" "~/$file.pre-dotfiles"
    ln -s "$(pwd)/$file" "~/$file"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
