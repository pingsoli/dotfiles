#!/usr/bin/env fish

function __fish_cdw_completion
  ls "$MY_WORKSPACE"
end

# Change to my workspace quickly
complete -f -c cdw -a '(__fish_cdw_completion)'
