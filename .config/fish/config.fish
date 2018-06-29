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
alias maek="make"
alias meak="make"
alias amek="make"
alias amke="make"
alias mkae="make"
alias mak="make"
alias kmae="make"
alias sl="ls"

set -gx FISH_PATH $HOME/.config/fish

set fish_greeting

# pyenv (python version manager)
set -gx PYENV $HOME/.pyenv
set -gx PATH $PYENV/bin $PATH
source (pyenv init - | psub)

# ag (searcher tool)
set -gx AG /usr/local/ag
set -gx PATH $AG/bin $PATH

# Fzf remove duplicate history
set -g hist_ignore_dups
set -x FZF_DEFAULT_COMMAND "ag -g \"\""
set -x FZF_CTRL_T_COMMAND "ag -g \"\""
