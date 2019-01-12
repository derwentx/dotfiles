

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
# Install Bash 4.
brew install bash
brew install bash-completion2

# Install GNU grep
brew tap homebrew/dupes
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
brew install the_silver_searcher
brew install ack
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install `wget` with IRI support.
brew install wget --with-iri

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Setup ZSH Shell

brew install curl
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install git
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
chsh "${BREW_PREFIX}/bin/zsh"

# Build tools
brew install cmake bazel boost-build m4 automake autoconf

# install python stuff
brew install pyenv
pip install --upgrade pylama pylama-pylint yapf autopep8 flake8

# Ruby stuff
brew install ruby rbenv ruby-build

# Haskell stuff
brew install stack
stack setup
brew install haskell-stack ghci
stack install ghc-mod hlint stylish-haskell

# Install Developer stuff
brew install emacs tmux
brew install ctags source-highlight
brew cask install atom sublime-text3 macvim
brew install macvim-askpass
brew cask install iTerm2 github-desktop transmit dash
brew install vimpager
brew install gpg # for GPG signing commits
brew install git-lfs

# Embedded Electronics
brew cask install avrdude gcc-arm-embedded dfu-util libtool picocom
brew install port
sudo port install interceptty

# Windows hacking
brew install mingw-w64 wine winetricks virtualbox mono

# Install web dev stuff
brew install mysql npm node sqlparse
brew cask install apache phpmyadmin sequel-pro

# Install other CLI stuff
brew install htop mtr archey ansifilter
brew tap ravenac95/sudolikeaboss
brew install sudolikeaboss

# Browsers
brew cask install google-chrome opera firefox vivaldi
brew install lynx

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
brew install socat
brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
brew cask install wireshark
brew install wpscan

# Install other useful binaries.
brew install dark-mode
brew install lua lua-jit
brew install pv
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew cask install tshark
brew install vbindiff

# images
brew install exiv2
brew install imagemagick --with-webp
brew install webkit2png
brew install pngcheck
brew install xpdf

# Compression
brew install zopfli
brew install xz
brew install p7zip
# brew install pigz


# Remove outdated versions from the cellar.
brew cleanup
