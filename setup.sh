#!/bin/bash

ARCH=$(uname)
if [ "${ARCH}" = "Linux" ]; then
  rpm -qa | grep -q lua || echo "[Warn] Not install: lua"
  rpm -qa | grep -q lua-devel || echo "[Warn] Not install: lua-devel"
elif [ "${ARCH}" = "Darwin" ]; then
  edo$ brew list | grep -q lua || echo "[Warn] Not install: lua"
fi

vim --version | grep -q '+lua' || echo "[Warn] Vim can not load '+lua'. Check your vim version 7.4 or later"

readonly DOT_FILES=( .bashrc .bash_profile .bash.d .vimrc .gitconfig .hgrc .rspec .gemrc .caprc .psqlrc)
readonly DOT_DIRS=( .vim .subversion )

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

  ln -si ~/dotfiles/${dir} ~/${dir}
  echo "[Make]: Symlink: ~/${dir}"
done
