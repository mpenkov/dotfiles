set -o vi
export EDITOR=vim

export CLICOLOR=1
#
# http://superuser.com/questions/117841/get-colors-in-less-command
#
export LESS='-R'


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#
# I keep machine-specific stuff in .bash_aliases.private.  It's not in
# version control because it'd be a hassle to maintain.
#
if [ -f ~/.bash_aliases.private ]; then
    . ~/.bash_aliases.private
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#
# http://docs.python-guide.org/en/latest/dev/virtualenvs/
#
if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    source ~/.local/bin/virtualenvwrapper.sh
fi
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=$HOME/envs
export PATH=~/.local/bin:~/go/bin:$PATH

#
# https://dev.to/gonedark/tweak-your-terminal-for-git
#
[[ -f "$HOME/git/dotfiles/git-completion.bash" ]] && source "$HOME/git/dotfiles/git-completion.bash"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#
# https://unix.stackexchange.com/questions/11856/sort-but-keep-header-line-at-the-top
#
body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}
export body

#
# keyboard tweaks: make CapsLock another Ctrl, switch casing for underscore/backslash
#
/usr/bin/setxkbmap -option "ctrl:nocaps"
xmodmap ~/.Xmodmap

. /usr/share/autojump/autojump.sh

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
