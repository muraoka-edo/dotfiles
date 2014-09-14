#!/bin/bash

readonly DOT_FILES=( .bashrc .bash_profile .vimrc .gitconfig .hgrc .rspec )
readonly DOT_DIRS=( .vim )

for file in ${DOT_FILES[@]}
do
  if [ -a ~/${file} ]; then
      if [ -L ~/${file} ]; then
          echo "[Warn]: Exsits Symlink: ~/${file}"
      elif [ -d ~/${file} ]; then
          echo "[Warn]: Exsits Dir: ~/${file}"
      else
          echo "[Warn]: Exsits File: ~/${file}"
          mv -i ~/${file} ~/dotfiles/${file}
          ln -si ~/dotfiles/${file} ~/${file}
          echo "[Make]: Symlink: ~/${file}"
      fi
  else
    ln -si ~/dotfiles/${file} ~/${file}
    echo "[Make]: Symlink: ~/${file}"
  fi
done

for dir in ${DOT_DIRS[@]}
do
  _lnk=$( echo ${dir} | sed -e 's/^\.//g' )
  lnk=$( echo ${_lnk} | sed -e 's/$/.d/g' )

  ln -si ~/dotfiles/${lnk} ~/${dir}
  echo "[Make]: Symlink: ~/${dir}"
done
