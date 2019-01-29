# Quick cds
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."

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

set -gx FISH_PATH $HOME/.config/fish

set fish_greeting

if type -q "pyenv"
  ## pyenv (python version manager)
  set -gx PATH $HOME/.pyenv/bin $PATH
  source (pyenv init - | psub)
end

if type -q "fzf"
  ## Remove fzf duplicate history
  # set -g hist_ignore_dups
  # set -gx FZF_DEFAULT_COMMAND "command ag -g ''"
  # set -gx FZF_FIND_FILE_COMMAND "ag --hidden --ignore .git -g \"\""
end

if type -q "tmux"
  # Force tmux using 256 color-mode
  alias tmux="tmux -2"
  alias ta="tmux attach"
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
