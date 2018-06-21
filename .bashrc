case $- in
    *i*) ;;
      *) return;;
esac

export TERM=rxvt-256color

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	   color_prompt=yes
    else
	   color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\] ( \u ) \[\033[1;33m\]-> \[\033[0m\]"
#PS1="\[\033[0;49;32m\][ \w ]\[\033[00m\]\n\[\033[0;49;37m\][ \\$ ]\[\033[00m\]\[\033[:49;36m\]-> \[\033[00m\]"
#else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
    #PS1="\[\033[0;49;32m\][ \w ]\[\033[00m\]\n\[\033[0;49;37m\][ \\$ ]\[\033[00m\]\[\033[:49;36m\]-> \[\033[00m\]"
#fi

function update_prompt(){
	echo -e "\[\033[0;49;32m\][ \D{%m\\%d} - \A -> \w ]\[\033[00m\]\n\[\033[0;49;37m\][ \\$ ]\[\033[00m\]\[\033[:49;36m\]-> \[\033[00m\]"
}
PROMPT_COMMAND='PS1=$(update_prompt)'

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1=$(update_prompt)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
