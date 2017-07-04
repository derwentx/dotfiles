# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# ZSH customization
ZSH_THEME="powerlevel9k/powerlevel9k"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git, zsh-autosuggestions, zsh-syntx-highlighting, brew, npm, z, colorize, autopep8, cabal, dirhistory, lein, macports, osx, perl, pep8, python, pip, sublime, taskwarrior, wd, vi-mode, zsh_reload)
bindkey -v
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Import enviroment
source ~/.exports
source ~/.aliases
source ~/.functions

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"
