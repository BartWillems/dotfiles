#!/bin/bash

##FUNCTIONS
function ubuntu {
  sudo apt update;
  sudo apt install cmake gcc ctags python2.7-dev vim vim-nox-py2 htop tmux git zsh curl dh-autoreconf;
  sudo apt upgrade
}


function fedora {
  sudo dnf install cmake gcc ctags python2.7-dev vim htop tmux git zsh curl;
  sudo dnf upgrade
}

DISTRO=$(lsb_release -a 2>/dev/null | grep 'Distributor' | awk 'END {print $3}')
USER=$(whoami)

case $DISTRO in
  ('Ubuntu')
    ubuntu
    ;;

  'Fedora' )
    fedora
    ;;

  *)
    ;;
esac

ln -s $(pwd)/.vim                 /home/$USER/.vim
ln -s $(pwd)/.vimrc               /home/$USER/.vimrc
ln -s $(pwd)/.tmux.conf           /home/$USER/.tmux.conf
ln -s $(pwd)/.config/base16-shell /home/$USER/.config/base16-shell

git submodule update --init --recursive

./home/$USER/.vim/bundle/youcompleteme/install.py

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

dconf write "/org/gnome/desktop/input-sources/xkb-options" "['caps:swapescape']"
