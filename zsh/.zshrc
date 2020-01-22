# Default to tmux all the time
if [ -z $TMUX ]; then; tmux; fi

export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/go/bin:$HOME/.config/composer/vendor/bin:$GOPATH/bin:/usr/local/mysql/bin:$HOME/flutter/bin:Users/${USER}/Library/Android/sdk/platform-tools
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.composer/vendor/bin:$PATH

source $HOME/.cargo/env

## Make sure gpg works
export GPG_TTY=$(tty)

## Give this an open tcp port and it would return it's PID
## I usually use this to kill processes
## sudo kill -9 $(portpid 8080)
portpid()
{
	if [[ ${#1} -eq 0 ]] then
		echo "Provide a port number whose PID you'd like to get"
		return 64
	fi

	lsof -i tcp:$1 -P | awk '{print $2}' | grep -e "[0-9]"
}

## Stop random mail messages
export MAILCHECK=0

## Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

POWERLEVEL9K_MODE='nerdfonts-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"

## POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{249}%}\u2517%{%F{default}%} "

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir context vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(rbenv rvm battery time)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

POWERLEVEL9K_BATTERY_CHARGING='green'
POWERLEVEL9K_BATTERY_CHARGED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_DISCONNECTED='yellow'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"

source  ~/powerlevel9k/powerlevel9k.zsh-theme

export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git z docker)

source $ZSH/oh-my-zsh.sh

## EDITOR is the default EDITOR used for writing git commit messages.
export EDITOR="nvim"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

alias ctag="gotags -tag-relative=true -R=true -sort=true -f="tags" -fields=+l ."

## Nvim > vim
## If Nvim is installed, make the command vim to open nvim
if type nvim > /dev/null 2>&1; then
  alias vim="nvim"
fi

# Some other useful plugins
source $HOME/.zsh/bd/bd.zsh

## Simulate the awesome highlighting and autocompletion of fish shell
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

## Load another bash file regarded as containing secret info.
## This will usually contain secret keys and all of that.
## While I want my dotfiles to be on GitHub, this is too sensitive
source ~/.secrets

## Open Neovim in a cinch.
## If a path is given (as in `v path`), it opens the given path. Path can be a file or directory.
## If none is given (as in `v`), it opens up the current directory.
v()
{
	local toOpen=$1

	if [[ ${#toOpen} -eq 0  ]]; then
		toOpen="./"
	fi

	nvim $toOpen
}


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/lanreadelowo/go/bin/vault vault

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
eval 
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }
        
