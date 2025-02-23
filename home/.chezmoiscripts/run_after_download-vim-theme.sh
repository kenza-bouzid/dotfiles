
#! /bin/bash

themes_dir="~/.vim/pack/themes/start"
if [ ! -d "$themes_dir" ]; then
  mkdir $themes_dir
  cd $themes_dir
  git clone https://github.com/dracula/vim.git dracula
fi
