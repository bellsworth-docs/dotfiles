###############################################################################
# .bash_aliases. Put your ugly aliases here, and avoid mucking up your .bashrc.
###############################################################################

#
# This is to keep vim from starting with X extensions.
#
alias vim='/usr/bin/vim -X'
alias view='/usr/bin/view -X'

#
# history aliases
#
alias h='history | tail'
alias hig='history | grep'

#
# ls changes -- colors, show file type indicators
#
alias ls='ls -F --color=auto'
alias ll='ls -AlF --color=auto'
alias lt='ll -tr'
alias la='ls -a --color=auto'

#
# grep changes
#
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#
# tmux aliases
#
alias ta='tmx2 att -d -t'
alias tw='tmx2 new-session -A -s work'
alias tn='tmx2 -2 new -s'