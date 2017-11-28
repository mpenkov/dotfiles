set -euxo pipefail
cd

#
# The SSH url works well if your SSH setup is legit, and lets you push changes back.
# The HTTPS url works in any condition, but won't let you push changes.
# Make HTTPS the default, because cloning is more important than pushing in our use case.
#
# url=git@github.com:mpenkov/dotfiles.git
url=https://github.com/mpenkov/dotfiles.git
cloned=~/git/dotfiles
if [ ! -d "$cloned" ]
then
    mkdir -p ~/git
    git clone $url "$cloned"
fi

for fname in .bash_aliases .bashrc .gitconfig .githelpers .screenrc .vimrc .fzf.bash
do
    if [ -f "$fname" ] || [ -L "$fname" ]
    then
        mv -n "$fname" "$fname.bak.$(date +%Y%m%d)"
    fi
    ln -s "$cloned/$fname"
done
