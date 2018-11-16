# Quick cds
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."

# Force tmux using 256 color-mode
alias tmux="tmux -2"

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
#alias sl="ls" # I love the running train, disable it.
alias s="ls"

set -gx FISH_PATH $HOME/.config/fish

set fish_greeting

if type -q "pyenv"
  ## pyenv (python version manager)
  set -gx PATH $HOME/.pyenv/bin $PATH
  source (pyenv init - | psub)
end

if type -q "fzf"
  ## Remove fzf duplicate history
  set -g hist_ignore_dups
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
