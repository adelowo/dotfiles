export TERM="xterm-256color"
export LANG="en_US.UTF-8"
export GPG_TTY=$(tty)

## GPG signing to keep my sanity
export GPG_TTY=$(tty)

# keep tmux alive always
if [ -z "$TMUX" ]; then
  exec tmux new-session -A -s workspace
fi


export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/go/bin:$HOME/.config/composer/vendor/bin:$GOPATH/bin:/usr/local/mysql/bin:$HOME/flutter/bin:Users/${USER}/Library/Android/sdk/platform-tools
export PATH=/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/Users/lanreadelowo/.local/share/solana/install/active_release/bin:$PATH"
# add ruby gems to PATH too
if which ruby >/dev/null && which gem >/dev/null; then
    export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

## zig lang
export PATH="$PATH:$(brew --prefix llvm@15)/bin"
export LDFLAGS="$LDFLAGS -L$(brew --prefix llvm@15)/lib"
export CPPFLAGS="$CPPFLAGS -I$(brew --prefix llvm@15)/include"

source $HOME/.cargo/env

lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

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


POWERLEVEL10K_MODE='nerdfonts-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"

## POWERLEVEL10K_PROMPT_ON_NEWLINE=true
POWERLEVEL10K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
POWERLEVEL10K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{249}%}\u2517%{%F{default}%} "

POWERLEVEL10K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL10K_STATUS_VERBOSE=false
POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir context vcs)
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(rbenv rvm battery time)
POWERLEVEL10K_SHOW_CHANGESET=true
POWERLEVEL10K_CHANGESET_HASH_LENGTH=6

POWERLEVEL10K_BATTERY_CHARGING='green'
POWERLEVEL10K_BATTERY_CHARGED='$DEFAULT_COLOR'
POWERLEVEL10K_BATTERY_DISCONNECTED='yellow'
POWERLEVEL10K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL10K_BATTERY_LOW_COLOR='red'
POWERLEVEL10K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"

export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

export EDITOR="nvim"

alias ctag="gotags -tag-relative=true -R=true -sort=true -f="tags" -fields=+l ."

## Nvim > vim
## If Nvim is installed, make the command vim to open nvim
if type nvim > /dev/null 2>&1; then
  alias vim="nvim"
fi

if type bun > /dev/null 2>&1; then
  alias npm="bun"
  alias yarn="bun"
  alias npx="bunx"
fi


if type bat > /dev/null 2>&1; then
  alias cat="bat"
fi

if type lsd > /dev/null 2>&1;then
  alias ls="lsd"
fi

if type autojump > /dev/null 2>&1;then 
  [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
  # alias j="autojump"
  alias z="j"
fi



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


# Cannot remember where I got this from sadly. Probably Stackoverflow or Unix
# Stackexhange
work_on_project() {
    sleep $(echo "$1 * 60" | bc)

    for x in $(seq 1000); do say "Time to stop working fella"; sleep 0.5; done
}


# bun completions
[ -s "/Users/lanreadelowo/.bun/_bun" ] && source "/Users/lanreadelowo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


autoload -U compinit
compinit -i

source ~/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source <(kubebuilder completion zsh)
source <(starship init zsh)
