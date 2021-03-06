#!/usr/bin/env fish

function ge --description "edit file in git repository"

  set -l git_root_dir (git rev-parse --show-toplevel)
  set -l git_root_dir_len (echo -n "$git_root_dir" | wc -m)
  set git_root_dir_len (math $git_root_dir_len + 2)

  find "$git_root_dir" -type f                \
    -not \( -path "*/CMakeFiles/*" -prune \)  \
    -not \( -path "*/.git/*" -prune \)      | \
  cut -c "$git_root_dir_len"-               | \
  fzf --reverse                             | \
  read -l result; and vim "$git_root_dir/$result"

end
