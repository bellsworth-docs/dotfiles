# .aliases
# I'm putting all my aliases in here for the time being

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
# other commands, misc. changes
#
alias ta='tmx2 att -d -t'
alias tw='tmx2 new-session -A -s work'
alias tn='tmx2 -2 new -s'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

