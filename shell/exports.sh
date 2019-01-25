#!/usr/bin/env bash

# Make vim the default editor.
export EDITOR='nvim';

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer Australian English and use UTF-8.
export LANG='en_AU.UTF-8';
export LC_ALL='en_AU.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
# export MANPAGER='less -X';
# Use vimpager as manpater (supports mouse wheel and doesn't clear on quit)
export MANPAGER='vimpager';

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);


# usename stuff
export USER_NAME=$(whoami)

# Coreutils requires this
if [ -n "$(which brew)" ]; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi

# MTR requires this
export PATH="/usr/local/sbin:$PATH"
# FUSE requires this
export PATH="$PATH:/opt/gnu/sbin:/opt/gnu/bin"

# CUDA Requires this
# export PATH=/Developer/NVIDIA/CUDA-8.0/bin${PATH:+:${PATH}}
# export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
# export LD_LIBRARY_PATH=$DYLD_LIBRARY_PATH

# ESP Requires this:
export PATH="$PATH:$HOME/esp/xtensa-esp32-elf/bin"
export IDF_PATH="$HOME/esp/esp-idf"


# Pyenv requires this
if [ -n "$(which pyenv)" ]; then
    export PATH="$HOME/.pyenv:$PATH";
    eval "$(pyenv init -)";
    export PATH="$(pyenv root)/shims:$PATH";
    eval "$(pyenv virtualenv-init -)";
fi

# Macports requires this
export PATH="$PATH:/opt/local/bin:/opt/local/sbin"

# Macvim-askpass requires this
# export PATH="$PATH:$HOME/.vim/bin"

# Haskell requires this
export PATH="$PATH:$HOME/.local/bin"

#adb
# export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Use Brew PHP over system
if [ -n "$(which brew)" ]; then
    export PATH="$(brew --prefix php@7.2)/bin:$PATH"
fi

# User Brew openssl over system
if [ -n "$(which brew)" ]; then
    export PATH="$(brew --prefix openssl)/bin:$PATH"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# LaTeX requires this
export PATH="$PATH:/Library/TeX/texbin"

# Go requires this
export PATH="$PATH:$HOME/go/bin"

if [ -f '.secrets' ]; then
    source '.secrets'
fi

# Add `~/bin` to the `$PATH`
# export PATH="$HOME/bin:$PATH";
