# Install Dev box

## Ubuntu 18.10

From Ubuntu Software:

* Install Chromium
* Install Slack
* Install Spotify

## Tools

```
sudo apt-get install -y \
  wget \
  curl \
  git \
  tig \
  ncdu \
  ssh \
  rlwrap \
  jq \
  pass \
  gawk \
  silversearcher-ag \
  tmux \
  xsel \
  xclip \
  zsh \
  zsh-syntax-highlighting
```
* Setup pass
```
# Import gpg key

# Init pass
pass init "Arthur Caillau"
pass git init

# Add remote
# Do not forget to change Inbound rules for sshing
pass git remote add origin git@ec2-1-2-3-4-5.compute-1.amazonaws.com:~/pass-repo.git

# Pull latest from remote origin
pass git pull --allow-unrelated-histories origin master
```
* Installing dotfiles
```
# Clone dotfiles config
git clone https://github.com/Chouffe/dotfiles ~/.dotfiles
# Sync dotfiles
rcup -v
```
* Terminal setup
```
sudo apt-get install rxvt-unicode-256color
```
* Text editor setup
  * Install neovim from sources (AppImage)
  * Install vim-plug for neovim
  * Run `:PlugInstall`
* Tmux setup
```
# Install tmuxp
# Source ~/.tmux.conf
# Prefix + I to install plugins
```
* ranger
```
sudo apt-get install -y ranger \
  caca-utils \
  highlight \
  atool \
  w3m \
  poppler-utils \
  mediainfo
```
* Virtualenvwrapper
```
sudo apt-get install python3-pip
sudo pip3 install virtualenvwrapper
```
* Sound
```
sudo apt-get install pavucontrol
```
* Xmonad and xmobar
```
sudo apt-get install xmonad suckless-tools xscreensaver xmobar
```
