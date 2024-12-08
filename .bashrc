# Ensure shell is interactive
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Window size update
shopt -s checkwinsize

# Enable lesspipe for friendly file viewing
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Chroot prompt
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Fancy prompt with Git branch support
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 "\[\033[01;33m\] (%s)\[\033[00m\]")\n$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " (%s)")\n$ '
fi

# Xterm title
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
esac

# Color support for commands
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias py='python3.11'
alias mk='make'
alias nv='nvim'
alias tm='tmux'
alias tml='tmux ls'
alias tmk='tmux kill-session -t'
alias tmks='tmux kill-server'
alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias dk='docker'
alias dkps='docker ps'
alias cls='clear'
alias ext='exit'
alias pnv='pipenv'
alias pnvs='pipenv shell'
alias pnvr='pipenv run'
alias quartus='~/./intelFPGA_lite/23.1std/quartus/bin/quartus'

# Alert for long-running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Include ~/.bash_aliases if available
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Bash completion
if ! shopt -oq posix; then
    [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
    [ -f /etc/bash_completion ] && . /etc/bash_completion
fi

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export IGNOREEOF=5

# Custom functions
copycmd() {
    if [ -z "$1" ]; then
        history -p !! | xclip -selection clipboard
    else
        history -p !$1 | xclip -selection clipboard
    fi
}

clsall() {
    read -p "Are you sure you want to clear the terminal and scrollback buffer? (Y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo "Operation canceled."
    else
        clear && printf '\e[3J'
    fi
}

headclip() {
    local lines=1
    if [ $# -ge 2 ]; then
        lines=$1
        shift
    fi
    output=$(head -n "$lines" "$1")
    echo "$output" | xclip -selection clipboard
    echo "$output copied!"
}

# Set bash to use vi mode for command editing
set -o vi
bind -s 'set completion-ignore-case on'

# Add paths for custom binaries
export CWPROOT='/home/carburauto/SeismicUnix'
export PATH="${PATH}:${CWPROOT}/bin"
export PATH="~/anaconda3/bin:${PATH}"
export PATH="$PATH:/opt/nvim-linux64/bin"

# Conda initialization
__conda_setup="$('/home/carburauto/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/carburauto/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/carburauto/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/carburauto/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Custom colors for the terminal prompt
blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

export QSYS_ROOTDIR="/home/carburauto/intelFPGA_lite/23.1std/quartus/sopc_builder/bin"
export CWPROOT='/home/carburauto/SeismicUnix'
export PATH="${PATH}:${CWPROOT}/bin"
export CWPROOT='/home/carburauto/SeismicUnix'
export PATH="${PATH}:${CWPROOT}/bin"
