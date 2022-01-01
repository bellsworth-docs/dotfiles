# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#############################
# Special bash features below
#############################
shopt -s histappend checkwinsize cmdhist lithist
# only enable the following options for bash4 or better
if (($BASH_VERSINFO >= 4))
then
  shopt -s autocd cdspell dirspell globstar hostcomplete
fi

# emacs command-line editing (I should rethink this)
set -o emacs

# ignore ctrl-s and ctrl-1
stty -ixon

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#########################
# Setup colors
#########################
BLUE="\033[01;34m"
LBLUE="\033[01;36m"
RED="\033[01;31m"
YELLOW="\033[01;33m"
GREEN="\033[01;32m"
B_GREEN="\033[01;38;5;010m"
PURPLE="\033[01;35m"
ORANGE="\033[1;38;5;208m"
DEFAULT="\033[00;00m"

#export PS1="[\[${PURPLE}\]\w\[${DEFAULT}\]]\n[\[${RED}\]\h \[${DEFAULT}\]\A$\[{DEFAULT}\]]\$ "

# non-fancy prompt (I don't use this anymore):
# export PS1="[\w]\n[\h \!]\$ "

#export PS1="[\[${PURPLE}\]\w\[${DEFAULT}\]]\n[\[${RED}\]\h \[${DEFAULT}\]\A$\[{DEFAULT}\]]\$ "

##############################################################################
# Work-specific bash configurations, such as prompts or special variables, can
# be added to ~/.bashrc_work_specific, to be kept safe. Do not distribute the
# contents of ~/.bashrc_work_specific.
##############################################################################
if [ -f ~/.bashrc_work_specific ]; then
  . ~/.bashrc_work_specific
fi

# Fix colors for LS
# Dark backgrounds:
LS_COLORS=$LS_COLORS:'di=1;96:' ; export LS_COLORS

# Fix colors for GREP
export GREP_COLORS='ms=1;38;5;226:mc=01;91:sl=:cx=:fn=38;5;207:ln=38;5;119:bn=92:se=96'

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

######################################################################
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
# If you have work-specific definitions that shall not be made public,
# Add them to ~/.bash_aliases_work_specific.
######################################################################
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_work_specific ]; then
    . ~/.bash_aliases_work_specific
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
