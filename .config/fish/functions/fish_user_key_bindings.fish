function fish_user_key_bindings
  # If you want to unbind key mappings in fish,
  # use `fish_key_reader` command

  # Allowing move around between word and char in fish terminal
  bind \eh backward-char
  bind \el forward-char
  bind \ek forward-word
  bind \ej backward-word

  bind --erase \cx
end
