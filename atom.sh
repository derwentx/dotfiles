# install languages
apm install language-assembly language-elm language-haskell language-htaccess language-ini language-lisp language-lua language-supercollider language-tmux language-viml language-x86asm

# install linter, beautify & autocomplete
pip install yapf
brew install ctags beautysh
apm install linter autocomplete autocomplete-plus set-syntax atom-beautify yapf atom-ctags ctags-status

# install python stuff
brew install pyenv
pip install --upgrade pylama pylama-pylint yapf autopep8 flake8
apm install python-indent python-tools python-yapf linter-python autocomplete-python linter-pylama linter-pylint atom-python-virtualenv

# install php stuff
apm install linter-php atom-autocomplete-php

# Install Haskell stuff
brew install stack
stack setup
brew install haskell-stack
stack install ghc-mod hlint stylish-haskell
apm install haskell-ghc-mod haskell-grammar ide-haskell ide-haskell-cabal linter-hlint

# install workflow stuff
apm install split-and-move dash script sort-lines todo change-case project-manager platformio-ide-terminal join-lines-smarter change-case todo

# Integrations
apm install dash editorconfig

# Aesthetics
apm install file-icons
