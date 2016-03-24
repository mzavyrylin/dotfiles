#!/bin/sh

dir="$(cd "`dirname "$0"`"/..; pwd)"

dotfiles=`find ${dir} -type f -d 1 -name '.*'`

echo "Backing up first..."
for f in ${dotfiles}; do
  mv -f ~/${f} ~/${f}.backup
done

[[ "`pwd`" != "$HOME/.dotfiles" ]] && ln -sfv "${dir}/" ~/.dotfiles

for f in ${dotfiles}; do
  ln -sfv ${f} ~/$(basename ${f})
fi

echo "Updating vim plugins..."
~/.vim/bundle/get.sh

echo "Enter your name for git user.name:\c"
read GIT_USER_NAME

echo "Enter your email for git user.email:\c"
read GIT_USER_EMAIL

git config --global --replace-all user.name $GIT_USER_NAME
git config --global --replace-all user.email $GIT_USER_EMAIL

echo "\nDone"