#!/bin/bash

set -e

ln -s $(pwd)/.vim           $HOME/.vim
ln -s $(pwd)/.vimrc         $HOME/.vimrc
ln -s $(pwd)/.tmux.conf     $HOME/.tmux.conf

git submodule update --init --recursive

$HOME/.vim/bundle/youcompleteme/install.py
