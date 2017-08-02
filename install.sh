set -euxo pipefail
cd

cloned=~/git/dotfiles
if [ ! -d "$cloned" ]
then 
    mkdir -p ~/git
    git clone git@github.com:mpenkov/dotfiles.git "$cloned"
fi

for fname in .bash_aliases .bashrc .gitconfig .githelpers .screenrc .vimrc
do
    if [ -f "$fname" ] || [ -L "$fname" ]
    then
        mv -n "$fname" "$fname.bak.$(date +%Y%m%d)"
    fi
    ln -s "$cloned/$fname"
done
