alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ga='git add '
alias gai='git add --interactive'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff --color'
alias get='git '
alias gk='gitk --all&'
alias go='git checkout '
alias got='git '
alias grep='grep --color=auto'
alias gs='git status '
alias gx='gitx --all'
alias h='history && history -d $((HISTCMD-1))'
alias hh='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))'
alias rm='rm -I'

#-------------------
# Personal Aliases
#-------------------
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias j='jobs -l'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias l='ls -CF'
alias ll="ls -l --group-directories-first"
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'

# If your version of 'ls' doesn't support --group-directories-first try this:
# function ll(){ ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| \
#                egrep -v "^d|total "; }

alias gvim='gvim -f'
