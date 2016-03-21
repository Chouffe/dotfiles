# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export EDITOR='vim'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"
WORKON_HOME=~/Envs

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# My aliases
alias tmux='tmux -2'
alias tm='tmux -2'
alias t='tmux -2'
export TERM='xterm-256color'
[ -n "$TMUX" ] && export TERM='screen-256color'
alias r=ranger
alias h=htop
alias mux=tmuxinator
alias m=tmuxinator
alias v="nvim"
alias v="gvim -v"
# alias v="nvim"
# alias vim="nvim"
alias n="nvim"
alias tg=tig
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias pg="ping 8.8.8.8"
alias elm-repl='elm-repl --interpreter=node-js'

# My functions
ag-f () { ag -G ".*$1\$" $2 }

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(virtualenvwrapper git lein autojump sudo tmux jsontools python cabal)

source $ZSH/oh-my-zsh.sh
# source ~/.bin/tmuxinator.zsh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin"
export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.8.4/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.4/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
# export PATH=/home/chouffe/anaconda3/bin:$PATH

# export PATH=/home/chouffe/anaconda2/bin:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# # Android SDK
# export ANDROID_HOME=/opt/android-sdk-linux
# export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon
