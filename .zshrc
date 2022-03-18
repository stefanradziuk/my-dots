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

# set up z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

export EDITOR='nvim'
export BROWSER='google-chrome-beta'
export JAVA_HOME=/usr/lib/jvm/default
export XDG_DATA_HOME=/home/stefan/.local/share
export XDG_CONFIG_HOME="$HOME/.config"

unsetopt correct

alias l='ls -lah'
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 16 | tr -d '\n'; echo"
alias sudo='sudo '
alias :q="exit"
alias :e="nvim -p"
alias vi="nvim -p"
alias vim="nvim -p"
alias nvim="nvim -p"
alias vimi="nvim -c 'startinsert'"
alias svim="sudo -E nvim"
alias sim="sudo -E nvim"
alias icat="kitty +kitten icat"
alias gdiff="git difftool --no-symlinks --dir-diff"
alias diff="wdiff"
alias ayy="yay"
alias sicstus="rlwrap /usr/local/sicstus4.4.1/bin/sicstus"
alias emacs="emacs -nw"
alias pyton="python"
alias pytonne="python"
alias copy="xclip -selection clipboard"
alias cate="cksum"
alias colorpicker="colorpicker --short --preview"

# gui-like ctrl word jumping
bindkey "^[Od"	backward-word
bindkey "^[Oc"	forward-word
bindkey "^H"	backward-kill-word
bindkey "^[[3^"	kill-word

source "$HOME/.secrets"

gi() {
  touch .gitignore
  curl "https://www.toptal.com/developers/gitignore/api/$1" >> .gitignore
}

mann() {
  curl "cheat.sh/$1" | bat
}

mailman_sync() {
  echo "docsoc's password: "
  read -sr
  echo "$REPLY" | ssh docsoc 'mailmansub/run.sh'
}

# touches a file, creating parent dirs as necessary
mktouch() {
  mkdir -p "$(dirname "$1")" && touch "$1"
}

py() {
  python -c "print($*)"
}

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

