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

# Cask
brew tap Caskroom/cask
brew update

# Repo
brew --repo homebrew/core

# Install `wget` with IRI support.
brew install wget --with-iri
# Install GNU grep
brew tap homebrew/dupes; brew install grep
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Ag is great for finding shit
brew install the_silver_searcher
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
brew install binwalk
brew install blueutil
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
brew install exploitdb
# brew install fcrackzip
# brew install foremost
brew install gdb
brew install gobuster
# brew install hashpump
brew install hydra
brew install john-jumbo
# brew install knock
# brew install netpbm
brew install nmap
brew install ncrack
brew install netcat
brew install nikto
brew install owasp-zsc
brew cask install java owasp-zap
# brew install pngcheck
brew install socat
brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
brew cask install wireshark
brew install wpscan
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
brew cask install tshark
brew install vbindiff
brew install webkit2png
brew install zopfli

# Setup ZSH Shell

brew install curl
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
chsh /usr/local/bin/zsh

# Install Developer stuff

brew install vim emacs tmux
brew cask install iTerm2 github-desktop transmit dash
brew install ctags source-highlight
brew cask install atom sublime-text3 macvim
brew install macvim-askpass
brew install vimpager cmake
brew install gpg # for GPG signing commits
# Build tools
brew install bazel boost-build m4 automake autoconf
# Embedded Electronics
brew cask install avrdude gcc-arm-embedded dfu-util libtool picocom
brew install port
sudo port install interceptty
# Windows hacking
brew install mingw-w64 wine winetricks virtualbox

# Install web dev stuff
brew install mysql npm node sqlparse
brew cask install apache phpmyadmin sequel-pro

# Ruby stuff
brew install ruby rbenv ruby-build

# Install other CLI stuff
brew install htop mtr archey ansifilter
brew tap ravenac95/sudolikeaboss
brew install sudolikeaboss

# Browsers
brew cask install google-chrome opera firefox vivaldi

# Comms
brew cask install discord slack skype

# productivity
brew cask install alfred cheatsheet dropbox synergy bettertouchtool

# Finder extensions
brew cask install path-finder qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv

# Install other apps
brew cask install disk-inventory-x exercism
brew cask install google-drive etcher

# Audio engineering
brew cask install soundflower soundflowerbed milkytracker

# Install OS Tweaking apps
brew cask install gfxcardstatus istat-menus bartender hammerspoon

# Have to install metasploit manually: https://www.darkoperator.com/installing-metasploit-framewor/
brew services start postgresql

# Remove outdated versions from the cellar.
brew cleanup
