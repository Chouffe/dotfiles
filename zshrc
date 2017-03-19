# Set name of the theme to load.
set -g pane-border-fg black
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,functions,aliases,exports,bindings,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

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
# plugins=(git lein autojump sudo tmux jsontools python cabal)
# virtualenvwrapper
plugins=(git gitfast git-extras tig fasd extract lein sudo tmux jsontools python cabal brew catimg web-search zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Virtualenvwrapper
# source /usr/local/bin/virtualenvwrapper.sh
source ~/.local/bin/virtualenvwrapper.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# # Android SDK
# export ANDROID_HOME=/opt/android-sdk-linux
# export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# AUTO TMUX
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tm new-session
    else
        tm attach-session -t "$ID" # if available attach to it
    fi
fi

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# Loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Syntax Highlighting
# source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Right Prompt
# RPROMPT="$FG[013]%D{%H:%M}%{$reset_color%}$FG[015] %D{»} %{$reset_color%}$FG[014]%D{%m/%d}%{$reset_color%}"
RPROMPT=""
