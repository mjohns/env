# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"
# simple, eastwood, minimal

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(zsh-autosuggestions git zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# https://github.com/larkery/zsh-histdb
source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'

bindkey -v
bindkey -M vicmd 'gh' beginning-of-line
bindkey -M vicmd 'gl' end-of-line
# from zsh-fzf-history-search
bindkey '^R' fzf_history_search
KEYTIMEOUT=1

alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"
alias vim="nvim"
