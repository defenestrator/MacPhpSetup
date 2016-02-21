#@IgnoreInspection BashAddShebang
# So PhpStorm won't squawk.
#################################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

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

# User configuration
export GOROOT=/usr/local/bin/go
export GOPATH=/Users/jeremy/Code/Go/
export PATH=$GOPATH/bin:$PATH
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/bin:/Users/jeremy/.composer/vendor/bin:/usr/local/bin/phantomjs-2.0.0-macosx/bin"
source $ZSH/oh-my-zsh.sh
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-2.0.0

# Elixir Lang Path
export PATH="$PATH:/path/to/elixir/bin"

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

# Homebrew ALL THE THINGS!
export PATH="$(brew --prefix)/bin:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs
alias behat='vendor/bin/behat'
alias phpspec='vendor/bin/phpspec'
alias phpunit='vendor/bin/phpunit'
alias cmp='composer'
alias art='php artisan'
alias hatchssh='ssh -i ~/t1microFreeKey.pem ubuntu@54.149.97.33'
alias ansibletest='ansible all -m ping -u ubuntu --private-key t1microFreeKey.pem'
alias sshaws='ssh -i ~/t1microFreeKey.pem'
alias flushit='composer dump-autoload -o && art clear-compiled && art optimize'
alias hssh='homestead ssh'
alias hsgo='homestead up'
alias hsup='homestead up'
alias gc='git commit -m'
alias laradeps="brew update && brew upgrade && composer self-update && composer global update && npm update --global && composer update ; npm update"
alias hshalt='homestead halt'
alias gittyuptream="git fetch upstream && git checkout master && git merge upstream/master"
alias GET='curl -X GET'
alias PUT='curl -X PUT'
alias POST='curl -X POST'
alias DELETE='curl -X DELETE'
alias UPDATE='curl -X UPDATE'
alias vup='vagrant up'
alias vupp='vagrant up --provision'
alias vhalt='vagrant halt'
alias ezsh='vim ~/.zshrc'
alias vssh='vagrant ssh'
alias phpcpd='php ./vendor/sebastian/phpcpd/phpcpd'
# travis-ci gem
[ -f /Users/jeremy/.travis/travis.sh ] && source /Users/jeremy/.travis/travis.sh