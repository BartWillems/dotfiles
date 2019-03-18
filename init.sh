#!/bin/bash

set -e

# Make sure this is executed from the repo's directory
cd "${0%/*}"

ln -s "$(pwd)/.vim"           "$HOME/.vim"
ln -s "$(pwd)/.vimrc"         "$HOME/.vimrc"
ln -s "$(pwd)/.tmux.conf"     "$HOME/.tmux.conf"
ln -s "$(pwd)/.config/nvim"   "$HOME/.config/nvim"

