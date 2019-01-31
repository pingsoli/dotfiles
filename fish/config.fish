#!/usr/bin/env fish

set -g FISH_PATH $HOME/.config/fish
set -g MY_WORKSPACE $HOME/workspace

# Remove fish shell greeting message
set fish_greeting

# Quick cds
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
alias .6="cd ../../../../../../.."

# Typos
alias cmaek="cmake"
alias cmeak="cmake"
alias cmkae="cmake"
alias camke="cmake"
alias cmkae="cmake"
alias maek="make"
alias meak="make"
alias amek="make"
alias amke="make"
alias mkae="make"
alias mak="make"
alias kmae="make"
alias sl="ls"
alias s="ls"
alias l="ls"

# Abbrs
abbr cdfish="cd $FISH_PATH"
abbr cdff="cd $FISH_PATH/functions"
abbr sfish="source $FISH_PATH/config.fish"

if type -q "pyenv"
  ## pyenv (python version manager)
  set -gx PATH $HOME/.pyenv/bin $PATH
  source (pyenv init - | psub)
end

if type -q "tmux"
  # Force tmux using 256 color-mode
  alias tmux="tmux -2"
  abbr ta="tmux attach"
end

## Set clang as default compiler.
# set -gx CC /usr/bin/clang
# set -gx CXX /usr/bin/clang++

## Java development environment.
# set -gx JAVA_HOME /usr/local/jdk1.8
# set -gx PATH $JAVA_HOME/bin $PATH

## set CDPATH for autocomplete when his tab.
# It's vexing when different directories have same names.
# set -g CDPATH . ~/workspace
