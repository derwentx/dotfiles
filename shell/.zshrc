# for tmux
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# ZSH customization
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="spaceship"
# ZSH_THEME="blinks"

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(
    git
    # zsh-autosuggestions
    zsh-syntax-highlighting
    brew
    npm
    # z
    colorize
    autopep8
    cabal
    dirhistory
    lein
    macports
    osx
    perl
    pep8
    python
    pip
    # sublime
    taskwarrior
    wd
    vi-mode
    zsh_reload
)

export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_TIME_SHOW=true
source $ZSH/oh-my-zsh.sh
export ZSH_AUTOSUGGEST_USE_ASYNC
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# keybindings
bindkey -e
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
# bindkey "^N" insert-last-word
bindkey "^N" history-search-forward
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# source "$ZSH_CUSTOM/themes/alien/alien.zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# added by travis gem
[ -f /Users/derwent/.travis/travis.sh ] && source /Users/derwent/.travis/travis.sh
