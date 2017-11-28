# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

#
# Activate autojump.  On my Mac, it's installed via homebrew.
# On an Ubuntu system, it would be:
#
# source /usr/share/autojump/autojump.bash
#
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export CLICOLOR=1

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

if [ -f ~/.bash_aliases.private ]; then
    . ~/.bash_aliases.private
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

set -o vi

export PYTHONIOENCODING="utf-8"

#
# http://superuser.com/questions/117841/get-colors-in-less-command
#
export LESS='-R'

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PKG_CONFIG_PATH=$HOME/lib/pkgconfig:$PKG_CONFIG_PATH

#
# for jsc on OS/X
#
export PATH=$PATH:/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/

export FLAKE8_STRICT=True

#
# http://docs.python-guide.org/en/latest/dev/virtualenvs/
#
export WORKON_HOME=~/envs
source /usr/local/bin/virtualenvwrapper.sh

export PYTHONPATH=$HOME/src/libsvm-3.21/python:$PYTHONPATH

#
# https://dev.to/gonedark/tweak-your-terminal-for-git
#
[[ -f "$HOME/git/dotfiles/git-completion.bash" ]] && source "$HOME/git/dotfiles/git-completion.bash"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
