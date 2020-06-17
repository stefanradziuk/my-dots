#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR='nvim'
export BROWSER='firefox'
# export BROWSER='/home/stefan/bin/google-chrome-beta'

alias l='ls -lah'
alias ls='ls --color=auto'
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 8 | tr -d '\n'; echo"
alias sudo='sudo '
alias :q="exit"
alias :e="nvim -p"
alias vi="nvim -p"
alias vim="nvim -p"
alias nvim="nvim -p"
alias icat="kitty +kitten icat"
alias gdiff="git difftool --no-symlinks --dir-diff"
alias diff="wdiff"

# gui-like ctrl word jumping
bindkey "^[Od"	backward-word
bindkey "^[Oc"	forward-word
bindkey "^H"	backward-kill-word
bindkey "^[[3^"	kill-word

