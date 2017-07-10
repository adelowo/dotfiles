 export GOPATH=$HOME/goat
 export GOROOT=/usr/local/bin/go
 export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/bin/go/bin:$HOME/.config/composer/vendor/bin:$GOPATH/bin

# Path to your oh-my-zsh installation.
export ZSH=/home/adez/.oh-my-zsh

ZSH_THEME="spaceship"

ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git z)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"


# Aliases
# random generates a random string.../dev/urandom is considered secure though ..
# Cannot remember the usecase i had for this though
alias random="< /dev/urandom tr -dc A-Za-z0-9 | head -c47; echo"
alias ctag="gotags -tag-relative=true -R=true -sort=true -f="tags" -fields=+l ."
alias vim="nvim"
alias git_authors="git shortlog -s | cut -c8-"
alias git_prune_branches="git branch | grep -v "master" | sed 's/^[ *]*//' | sed 's/^/git branch -D /' | zsh"

## Sometimes my nternet modem comes up as a mass storage device... Here is the fix for that
alias boom="sudo usb_modeswitch -v 05c6  -p 1000 -V 05c6 -P 1000 -M "5553424312345678000000000000061b000000020000000000000000000000" && sudo wvdial" 

# Some other useful plugins 
source $HOME/.zsh/bd/bd.zsh

## Simulate the awesome highlighting and autocompletion of fish shell
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.secrets
