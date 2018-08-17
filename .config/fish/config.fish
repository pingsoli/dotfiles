# Aliases for all shelles
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."

# Tmux 256 color-mode
alias tmux="tmux -2"

# Typo aliases
alias cmaek="cmake"
alias cmeak="cmake"
alias cmkae="cmake"
alias camke="cmake"
alias cmkae="cmake"
alias maek="make -j4"
alias meak="make -j4"
alias amek="make -j4"
alias amke="make -j4"
alias mkae="make -j4"
alias mak="make  -j4"
alias kmae="make -j4"
alias sl="ls"
alias s="ls"

set -gx FISH_PATH $HOME/.config/fish

set fish_greeting

# pyenv (python version manager)
set -gx PYENV $HOME/.pyenv
set -gx PATH $PYENV/bin $PATH
source (pyenv init - | psub)

# ag (searcher tool), Ack.vim based on Ag.
set -gx AG /usr/local/ag
set -gx PATH $AG/bin $PATH

# Fzf remove duplicate history
# set -g hist_ignore_dups
# set -x FZF_DEFAULT_COMMAND "ag -g \"\""
# set -x FZF_CTRL_T_COMMAND "ag -g \"\""

# Set clang as default compiler.
set -gx CC /usr/bin/clang
set -gx CXX /usr/bin/clang++

# Java environment
set -gx JAVA_HOME /usr/local/jdk1.8
set -gx PATH $JAVA_HOME/bin $PATH

# set CDPATH for autocomplete when his tab.
# It's kind of vexing when different directories have same names.
# set -g CDPATH . ~/workspace
