#!/bin/sh

dir=`pwd`

echo "~/.Xmodmap"
cp -f .Xmodmap ~/

if [ ! -e ~/.gitconfig.backup ]; then
  echo "backup .gitconfig .."
  mv -f ~/.gitconfig ~/.gitconfig.backup
fi

echo "~/.gitconfig"
cp -f .gitconfig ~/.gitconfig

echo "Enter your name for git user.name:\c"
read GIT_USER_NAME

echo "Enter your email for git user.email:\c"
read GIT_USER_EMAIL

git config --global --replace-all user.name $GIT_USER_NAME
git config --global --replace-all user.email $GIT_USER_EMAIL
git config --global --replace-all core.excludesfile ~/.gitconfig

echo "~/.gitignore"
cp -f .gitignore ~/.gitignore

echo "Updating submodules"

git submodule init
git submodule update
git submodule foreach git checkout master
git submodule foreach git pull

echo "Removing existing vim dotfiles"

if [ ! -e ~/.vim.backup ]; then
  echo "backup .vim .."
  mv -f ~/.vim ~/.vim.backup
fi
if [ ! -e ~/.vimrc.backup ]; then
  echo "backup .vimrc .."
  mv -f ~/.vimrc ~/.vimrc.backup
fi

rm -Rf ~/.vim
rm -f ~/.vimrc

echo "~/.vimrc"
ln -s -f "$dir/vimrc/vimrc" ~/.vimrc
echo "~/.vim"
ln -s -f "$dir/vimrc" ~/.vim

cd vimrc/bundle
echo "Updating vim plugins..."
./get.sh
cd $dir

echo "~/.dotfiles"
[[ "`pwd`" != "$HOME/.dotfiles" ]] && ln -s -f "$dir/" ~/.dotfiles

cd $dir

echo "~/.zshrc"
cp -f .zshrc ~/.zshrc

echo "~/.zprofile"
cp -f .zprofile ~/.zprofile

echo "~/.tmux.conf"
cp -f .tmux.conf ~/.tmux.conf

echo "~/.psqlrc"
cp -f .psqlrc ~/.psqlrc

echo "\nDone"
