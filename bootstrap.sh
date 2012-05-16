#!/usr/bin/env sh

endpath="$HOME/.spf13-vim-3"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "thanks for installing spf13-vim\n"

# Backup existing .vim stuff
echo "backing up current vim config\n"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $i.$today; done


echo "cloning spf13-vim\n"
git clone --recursive -b xw http://github.com/xw2423/spf13-vim.git $endpath
mkdir -p $endpath/.vim/bundle
ln -sf $endpath/.vimrc $HOME/.vimrc
ln -sf $endpath/.vim $HOME/.vim
cp -f $endpath/.vimrc.local $HOME
cp -f $endpath/.gitconfig $HOME

echo "Installing Vundle"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "installing plugins using Vundle"
vim +BundleInstall! +BundleClean +q
