function fish_user_key_bindings
  fzf_key_bindings

  # If you want to unbind key mappings in fish,
  # use `fish_key_reader` command

  # Allow movement in fish terminal
  bind \eh backward-char
  bind \el forward-char
  bind \ek forward-word
  bind \ej backward-word
end
