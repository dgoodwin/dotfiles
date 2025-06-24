# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

DISABLE_AUTO_UPDATE="true"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git colorize  command-not-found copyfile cp kubectl history docker golang dnf yum systemd themes encode64 fasd)
# TODO: try autoenv

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

HISTSIZE=10000
HISTFILE=~/.history
SAVEHIST=10000
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list no
zstyle ':completion:*:history-words' menu yes

# Watch for other users logging in / out:
watch=(notme)

# cdpath stores paths to check if we cd somewhere not visibile in the
# absolute path:
setopt auto_cd
cdpath=( ~ ~/ ~/go/src/github.com/openshift/ ~/src/ )

export EDITOR=nvim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# kubernetes aliases
alias kg="kubectl get"
alias kgy="kubectl get -o yaml"
alias sd="sudo systemctl"
alias sdu="systemctl --user"
alias jc="sudo journalctl"


export PATH=~/bin:$PATH:~/go/bin/
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export GOPATH="$HOME/go"

# Better sharing of history across terminals:
setopt inc_append_history
setopt share_history



#########
# vi mode
#########

bindkey -v

# switch to command mode with jj
bindkey '^j' vi-cmd-mode

# `v` is already mapped to visual mode, so we need to use a different key to
# open Vim
bindkey -M vicmd "^V" edit-command-line

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# incremental search in insert mode
bindkey "^F" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward

# beginning search with arrow keys and j/k
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# beginning search in insert mode, redundant with the up/down arrows above
# but a little easier to press.
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward

# incremental search in vi command mode (questionable usefulness given the above)
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
# navigate matches in incremental search
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Beautiful theme.
fpath+=$HOME/.zsh/pure
#fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# git lb branch switching
function git_checkout_fzf() {
  local branch
  # Corrected awk command:
  branch=$(git branch --sort=-committerdate | awk '{print ($1 == "*") ? $2 : $1}' | fzf --height 40% --layout=reverse --border --prompt="Select branch: ")
  if [[ -n "$branch" ]]; then
    git checkout "$branch"
  fi
}
alias glb='git_checkout_fzf' # gcf for "git checkout fzf"

[[ -s "$HOME/.zshrc-system" ]] && source "$HOME/.zshrc-system"

[[ -s "/Users/dgoodwin/.gvm/scripts/gvm" ]] && source "/Users/dgoodwin/.gvm/scripts/gvm"
