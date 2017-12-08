# Dev dependencies

## Terminal

* rxvt-unicode-256colors
  * perl extensions:
    * clipboard
    * keyboard-select
    * font-size
    * matcher
    * ...
  * xsel, xclip
* tmux >= 2.0
  * tmux plugin manager (git clone)
  * Install all tmux plugins
  * Install tmuxp
* zsh
  * oh my zsh
    * syntax highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
    * auto suggestions: https://github.com/zsh-users/zsh-autosuggestions
* Inconsolata for Powerline font
* Inconsolata
* sudo localectl set-locale LANG=en_US.UTF-8

# Tools

* wget
* curl
* git
* tig
* htop
* iotop
* ncdu
* fasd
* ssh
* ag
* gawk for fzf mru
* rlwrap
* virtualenvwrapper
* fzf (should be installed with neovim)
  * https://github.com/junegunn/fzf/wiki/examples
* file manager: ranger
  * caca-utils
  * highlight
  * atool
  * w3m
  * poppler-utils
  * mediainfo
  * Run ranger --copy-config=all to activate all the plugins
* Neovim
  * Python modules
    * pip
    * python-dev
  * CMake for YCM - ./install.py
  * vim-plug
* rcm to manage my dotfiles
* Virtualbox
* dconf-tools
* ml
  * Anaconda
  * tensorflow
* docker
  * fpco/stack-build
  * fpco/stack-full
* Images
  * feh
* Rest Client
  * jq
* Disk Encrytpion
  * [tomb](https://github.com/dyne/Tomb/blob/master/INSTALL.md)

## Password manager

* password-store
  * passmenu: dmenu script
* gpg

## Config

* Remap Caps lock to Control
  * edit /etc/default/keyboard
  * set XKBOPTIONS=“ctrl:nocaps”
* Remap volume keys to volume
* Cursor speed:
  * xset q | grep rate
  * xset r rate 250 40

## Xmonad

* xmonad
* xmobar
  * trayer
    * nm-applet

## Browsers

* Chrome
  * Vimium
* Firefox
  * Vimperator

## Editor: nvim

* Install vim-plug
* Install all plugins with `:PlugInstall`

## Programming languages

* Clojure
  * Leiningen
  * Java
* Install nodejs and npm
* Install Anaconda for ML
* Haskell
  * cabal
  * stack
  * Stylish-haskell
  * ghc-mod
  * hlint
  * hoogle
    * Exuberant Ctags
    * Hasktags
* Scheme
* Racket
* Common Lisp

# Resources

https://begriffs.com/posts/2017-05-17-linux-workstation-guide.html
