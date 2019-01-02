# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/leo/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# FOLDERS
alias dev='cd ~/dev/'
alias mydot='cd ~/dev/tmp/my-dots'
alias bp='cd ~/dev/bitpump/'
alias vna='cd ~/dev/vnairline/'
alias cl='cd ~/dev/codelink/'
alias webster='cd ~/dev/codelink/webster'
alias webby='cd ~/dev/codelink/webby'
alias weaver='cd ~/dev/codelink/weaver'
alias papi='cd ~/dev/codelink/papi'
alias mami='cd ~/dev/codelink/mami'
alias codelink='cd ~/dev/codelink'

git_add_commit_push() {
  git add .
  git commit -m $1
  git push
}

# GIT
alias gap=git_add_commit_push
alias gal='git add .'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'
alias gpom="git pull origin master"
alias gp='git push'
alias gd='git diff'
alias gb='git branch'
alias gba='git branch -a'
alias del='git branch -d'

# RAILS / RUBY
alias rc='rails c'
alias rs='rails server'
alias b='bundle install'
alias bu='bundle update'
alias rsvna='rails server -p 5000'

# NPM
alias ni='npm install'
alias ns='npm start'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'
alias devtestall='docker-compose run --rm dev npm run testall'

# Jest test
alias testsingle='jest --coverage=false'
alias testall='npm run testall'

# Python
alias pstart='python manage.py runserver'

# LIST FILES
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# TMUX
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# MISC
alias md='mina deploy --trace' # deploy by mina

export TERM=xterm-256color

# 10ms for key sequences
KEYTIMEOUT=1

# For install capybara gem
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

# Pure prompt
autoload -U promptinit; promptinit
prompt pure

# export nvm_dir="$home/.nvm"
# [ -s "$nvm_dir/nvm.sh" ] && \. "$nvm_dir/nvm.sh"

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""' # ignore node_modules
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
