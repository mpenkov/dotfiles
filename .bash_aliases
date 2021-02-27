alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ga='git add '
alias gai='git add --interactive'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff --color'
alias get='git '
alias gk='gitk --all&'
alias got='git '
alias grep='grep --color=auto'
alias gs='git status '
alias gx='gitx --all'
alias h='history && history -d $((HISTCMD-1))'
alias hh='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'

#-------------------
# Personal Aliases
#-------------------
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

#alias j='jobs -l'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'

# If your version of 'ls' doesn't support --group-directories-first try this:
# function ll(){ ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| \
#                egrep -v "^d|total "; }

alias gvim='gvim -f'

alias tar=gtar

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cl='clear'
alias hun='history | tail -n 100'
alias tls='tmux list-sessions'
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tsc='tmux switch client -t'

alias zcat="gunzip -dc"
