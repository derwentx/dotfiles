#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;
git submodule update --init --recursive;

export files=(
    .aliases
    .bash_profile
    .bash_prompt
    .bashrc
    .curlrc
    .editorconfig
    .exports
    .functions
    .gdbinit
    .pylintrc
    .screenrc
    .tmux.conf
    .wgetrc
    .zshrc
    .vim
)

function doIt() {
    for file in "${files[@]}"
    do
        if [[ -f "$HOME/$file" || -L "$HOME/$file" || -d "$HOME/$file" ]]
        then
            mv "$HOME/$file" "$HOME/$file.pre-dotfiles"
        fi
        ln -s "$(pwd)/$file" "$HOME/$file"
    done
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
