# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

#
# Ignore certain command from history
#
export HISTIGNORE="cd*:ls:ls -la:ls -a"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#PS1="\[\e[32m\][\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[1;36m\]\h\[\e[m\]:\[\e[35m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]\[\e[0;35m\]\\$\[\e[m\] "

# new style with newline
export PS1="\[\033[0;31m\]\342\224\214\342\224\200\\[\033[01;32m\]\u\[\033[01;33m\]@\[\033[01;35m\]\h\[\033[0;31m\]]\342\224\200[\[\033[0;34m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$ \[\e[0m\]"


# neofetch
#
neofetch --disable resolution os wm theme icons terminal

# source aliases
#
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# private aliases
#
[ -f ~/.bash_aliases_home ] && source ~/.bash_aliases_home

# functions
#
[ -f ~/.bash_functions ] && source ~/.bash_functions

# grep colored ouput
export GREP_COLOR="1;91"

# less colored output
export LESS="-R"

# custom dir colors
[ -f ~/.dir_colors ] && eval $(dircolors -b ~/.dir_colors)

# ssh-add
#
#ssh-add -l > /dev/null || ssh-add

# id_rsa
#
eval $(keychain --eval --quiet  id_rsa ~/.ssh/id_rsa)
