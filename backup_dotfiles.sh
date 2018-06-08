#!/bin/bash

VIM_CONF="$HOME/.vimrc"
VIM_A_PLUGIN="$HOME/.vim/plugin/a.vim"
TMUX_CONF="$HOME/.tmux.conf"
FISH_CONF="$HOME/.config/fish"
YCM_CONF="$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

function backup()
{
  if [ ! -e ".vim/plugin" ]; then
    mkdir .config/
    mkdir -p .vim/plugin/
  fi

  # Show all executing command
  set -x

  cp -r "$FISH_CONF"    ".config"
  cp    "$TMUX_CONF"    "."

  # VIM
  cp    "$VIM_A_PLUGIN" ".vim/plugin"
  cp    "$VIM_CONF"     "."
  cp    "$YCM_CONF"     ".vim"
}

function push()
{
  git add .
  git commit -m "$1"
  git push origin master
}

case "$1" in
  backup)
    backup
    ;;

  push)
    if [ "$#" -ne 2 ]; then
      echo -e "no commit message\nusage: ./config.sh push <msg> [branch]"
      exit 2
    fi
    push "$2"
    ;;

  *)
    echo -e $"Usage: $0 { backup | push <msg> [branch] }"
    exit 1
esac
