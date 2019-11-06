# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/opt/libpq/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/leo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME='powerlevel9k/powerlevel9k'

POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs ram)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=grey"

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose)
plugins+=( nvm node npm fzf )

source $ZSH/oh-my-zsh.sh

# User configuration
# fzf working with ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

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
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ALIAS
alias c='clear'
alias dev='cd ~/dev/'
alias mydot='cd ~/dev/my-dots'
alias cl='cd ~/dev/codelink/'
alias codelink='cd ~/dev/codelink'

# GIT
git_add_commit_push() {
  git add .
  git commit -m $1
  git push
}

alias gap=git_add_commit_push
alias gal='git add .'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'
alias gpom="git pull origin master"
alias gp='git push'
alias gd='git diff'
alias gdc='git diff --cached'
alias gb='git branch'
alias gba='git branch -a'
alias del='git branch -d'
alias gmaster='git checkout master && git pull'

# RAILS / RUBY
alias rc='rails c'
alias rs='rails server'
alias b='bundle install'
alias bu='bundle update'

# NPM/YARN
alias ni='npm install'
alias ns='npm start'
alias ya='yarn add'

# LIST FILES
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# TMUX
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# DOCKER
alias dcl='docker container ls'
alias dil='docker image ls'
alias dcp='docker container prune -f'
alias dip='docker image prune -f'
alias dir='docker image rm'
alias dcrm='docker container rm'
alias dcs='docker container stop'
alias dcr='docker-compose run --rm'

# export NVM_DIR="/Users/$USER/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# source $(brew --prefix nvm)/nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/leo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/leo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/leo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/leo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
