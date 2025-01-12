#!/bin/sh

echo Setting up bashrc
printf "\n# get custom bashrc settings\nsource $HOME/dotfiles/.bashrc" >> $HOME/.bashrc

echo Setting up tmux.conf
ln -s .tmux.conf $HOME/

echo Setting up vimrc
ln -s .vimrc $HOME/
