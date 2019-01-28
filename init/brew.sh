

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  xcode-select --install
  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

  sudo xcodebuild -license accept
fi

# Repo
brew --repo homebrew/core

# Make sure we’re using the latest Homebrew.
brew update

# Cask
brew tap Caskroom/cask

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# brew install bash-completion2
# Install GNU grep
brew install grep
# brew tap homebrew/dupes 
# homebrew/dupes was deprecated. This tap is now empty as all its formulae were migrated.
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
brew install the_silver_searcher
brew install ack
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
brew install vim
brew install screen
brew install wget
brew install curl
brew install git
brew install htop 
brew install mtr 
brew install archey 
brew install ansifilter
brew install git-lfs
brew install exa
# brew tap ravenac95/sudolikeaboss
# brew install sudolikeaboss
brew install pv
brew install tmux

# Crypto utils
brew install gpg # for GPG signing commits
brew install openssh

# Compression utils
brew install zopfli
brew install xz
brew install p7zip
# brew install pigz

# Install Bash 5.
brew install bash
# Switch to using brew-installed bash as default shell
# if ! fgrep -q "$(brew --prefix bash)/bin/bash" /etc/shells; then
#   sudo tee -a /etc/shells < <( echo "$(brew --prefix bash)/bin/bash" );
#   chsh -s "$(brew --prefix bash)/bin/bash";
# fi;

# Setup ZSH Shell
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Switch to using brew-installed bash as default shell
if ! fgrep -q "$(brew --prefix zsh)/bin/zsh" /etc/shells; then
  sudo tee -a /etc/shells < <( echo "$(brew --prefix zsh)/bin/zsh" );
  chsh -s "$(brew --prefix zsh)/bin/zsh";
fi;

# Build tools
brew install cmake boost-build automake autoconf
# brew install bazel
# brew install m4

# install python stuff
brew install pyenv pyenv-virtualenv
# Note: you may have to install zlib headers with command below to install python
#  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
# Python linters
pip install --upgrade pip

# Ruby stuff
brew install ruby rbenv ruby-build

# NodeJS Stuff
brew install npm node

# Linters
pip install --upgrade pylama pylama-pylint yapf autopep8 flake8 yapf
brew install ctags beautysh source-highlight
brew install pandoc

# Haskell stuff
# brew install stack
# stack setup
# brew install haskell-stack ghci
# stack install ghc-mod hlint stylish-haskell

# Install Developer stuff
brew install emacs
brew install nvim
brew cask install atom 
# brew cask install sublime-text3 
# brew cask install macvim
# brew install macvim-askpass
brew cask install visual-studio-code
# brew cask install github-desktop
brew cask install git-kraken
brew cask install iTerm2
# (paid apps)
brew cask install transmit dash
# brew install vimpager

# Embedded Electronics
# brew cask install avrdude gcc-arm-embedded dfu-util libtool picocom
# brew install port
# sudo port install interceptty

# Windows hacking
# brew install mingw-w64 wine winetricks virtualbox mono

# Install web dev stuff
# brew install php
# brew install gmp
# brew install mysql npm node sqlparse
# brew cask install apache phpmyadmin sequel-pro

# Browsers
brew cask install firefox 
# brew cask install google-chrome 
# brew cask install opera 
# brew cask install vivaldi
# brew install lynx

# Comms
# brew cask install discord slack skype

# productivity
brew cask install alfred bettertouchtool
# brew cask install cheatsheet synergy

# Cloud storage
brew cask install dropbox 
brew cask install google-backup-and-sync

# Finder
brew cask install path-finder 
# Quick-look extensions
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv

# Install other apps
brew cask install disk-inventory-x 
# brew cask install exercism
brew cask install balenaetcher
brew cask install 1password

# Audio engineering
# brew cask install soundflower soundflowerbed milkytracker

# Install OS Tweaking apps
brew cask install gfxcardstatus hammerspoon keepingyouawake
# (Paid apps)
# brew cask install istat-menus
brew cask install bartender 
# Android Notifications
brew cask install noti

# Essential hacking tools
brew install arp-scan
brew install nmap
brew install speedtest_cli

# More CTF tools; see https://github.com/ctfs/write-ups.
# Have to install metasploit manually: https://www.darkoperator.com/installing-metasploit-framewor/
# brew services start postgresql
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install blueutil
# # brew install cifer
# # brew install dex2jar
# # brew install dns2tcp
# brew install exploitdb
# # brew install fcrackzip
# # brew install foremost
# brew install gdb
# brew install gobuster
# # brew install hashpump
# brew install hydra
# brew install john-jumbo
# # brew install knock
# # brew install netpbm
# brew install ncrack
# brew install netcat
# brew install nikto
# brew install owasp-zsc
# brew cask install java owasp-zap
# brew install socat
# brew install sqlmap
# # brew install tcpflow
# # brew install tcpreplay
# # brew install tcptrace
# # brew install ucspi-tcp # `tcpserver` etc.
# brew cask install wireshark
# brew install wpscan
# brew install testssl
# brew cask install tshark

# Install other useful binaries.
# brew install dark-mode
# brew install lua lua-jit
# brew install rename
# brew install ssh-copy-id
brew install tree
# brew install vbindiff

# images
# brew install exiv2
# brew install imagemagick --with-webp
# brew install webkit2png
# brew install pngcheck
# brew install xpdf


# Remove outdated versions from the cellar.
brew cleanup
