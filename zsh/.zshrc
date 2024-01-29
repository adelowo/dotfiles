export TERM="xterm-256color"
export LANG="en_US.UTF-8"

## GPG signing to keep my sanity
export GPG_TTY=$(tty)

## Stop random mail messages
export MAILCHECK=0

## Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# keep tmux alive
if [ -z "$TMUX" ]; then
  exec tmux new-session -A -s workspace
fi

export ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
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

# source  ~/powerlevel9k/powerlevel9k.zsh-theme

export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git z docker aws brew battery golang gh helm httpie kubectl minikube node react-native redis-cli rust ruby rails)

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

# Some other useful plugins
source $HOME/.zsh/bd/bd.zsh

## Simulate the awesome highlighting and autocompletion of fish shell
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

## Load another bash file regarded as containing secret info.
## This will usually contain secret keys and all of that.
## While I want my dotfiles to be on GitHub, this is too sensitive
# source ~/.secrets

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

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}


# Cannot remember where I got this from sadly. Probably Stackoverflow or Unix
# Stackexhange
work_on_project() {
    sleep $(echo "$1 * 60" | bc)

    for x in $(seq 1000); do say "Time to stop working fella"; sleep 0.5; done
}

# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source ~/.go.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lanreadelowo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lanreadelowo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lanreadelowo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lanreadelowo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/Users/lanreadelowo/.deta/bin:$PATH"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

# bun completions
[ -s "/Users/lanreadelowo/.bun/_bun" ] && source "/Users/lanreadelowo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
