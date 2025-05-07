#!/bin/sh

#echo Setting up bashrc
#printf "\n# get custom bashrc settings\nsource $HOME/dotfiles/.bashrc" >> $HOME/.bashrc
##make sure that bashrc is sourced every time a shell is started
##	- do this with .profile or .bash_profile
#printf "if [ -f ~/.bashrc ]; then\n    . ~/.bashrc\nfi" >> $HOME/.profile

echo Setting up tmux.conf
ln -s .tmux.conf $HOME/

echo Setting up vimrc
ln -s .vimrc $HOME/

echo "Setting up ssh config"
#if [ ! -d "~/.ssh" ]; then
#	mkdir ~/.ssh
#fi
mkdir -p ~/.ssh
ln ssh/config ~/.ssh/

echo "Setting up ghostty config"
mkdir -p $HOME/.config/ghostty
rm $HOME/.config/ghostty/config
ln -s ~/dotfiles/ghostty/config $HOME/.config/ghostty/
