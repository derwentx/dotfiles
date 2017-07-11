#!/usr/bin/env bash

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

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`. To do so, run `sudo chsh -s /usr/local/bin/bash`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri
# Install GBU grep
brew tap homebrew/dupes; brew install grep
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install arp-scan
brew install bfg
brew install binutils
# brew install binwalk
brew install blueutil
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
brew install gdb
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
brew install nmap
brew install nikto
# brew install pngcheck
# brew install socat
brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
# brew install pigz
brew install pv
brew install rename
# brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli

#######################################
# Derwent stuff, merge above
#######################################


# Install Shell

brew install curl
brew install zsh zsh-completions zsh-syntax-highlighting
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
chsh /usr/local/bin/zsh

# Install Developer stuff

brew install vim emacs tmux
brew cask install iTerm2 github-desktop atom sequel-pro macvim transmit dash
brew install ctags source-highlight npm
brew cask install sublime-text3
brew install mysql phpmyadmin
brew cask install apache


# Install security stuff

brew install htop mtr
brew cask install wireshark etcher
brew tap ravenac95/sudolikeaboss
brew install sudolikeaboss

# Install productivity stuff

brew cask install alfred cheatsheet dropbox synergy bettertouchtool
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv
brew tap ravenac95/sudolikeaboss\nbrew install sudolikeaboss
brew install sudolikeaboss

# Install other apps

brew cask install google-chrome opera slack skype path-finder firefox

# Install OS Tweaking apps

brew cask install gfxcardstatus istat-menus bartender hammerspoon






# Remove outdated versions from the cellar.
brew cleanup
