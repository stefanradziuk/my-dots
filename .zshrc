## If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/stefan/bin

# Path to your oh-my-zsh installation.
export ZSH=/home/stefan/.oh-my-zsh

# Display fps in wine
# export WINEDEBUG=fps

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mhFix"
# mhSeoul
# refined, sorin
# kolo, lambda (norm), mh, mrtazz, nicoulaj
# hedgehog, hyperzsh, lambda -mod

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
plugins=(colored-man-pages command-not-found git gitignore z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

export BROWSER='firefox'
# export BROWSER='/home/stefan/bin/google-chrome-beta'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# C programming tools from Duncan
export TOOLDIR=$HOME/c-tools
export PATH="$TOOLDIR/bin:$TOOLDIR/bin/$ARCH:$PATH"
export MANPATH=${MANPATH}:$TOOLDIR/man

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run alias.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=auto'
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 8 | tr -d '\n'; echo"
alias sudo='sudo '
# split into ~/bin/backlight_rel (relative) and backlight_abs (absolute)
alias backlight_abs='sudo tee /sys/class/backlight/intel_backlight/brightness <<< '
alias :e="vim -p"
alias :q="exit"
alias vim="vim -p"

DEFAULT_USER="stefan"

# gui-like ctrl word jumping
bindkey "^[Od"	backward-word
bindkey "^[Oc"	forward-word
bindkey "^H"	backward-kill-word
bindkey "^[[3^"	kill-word
