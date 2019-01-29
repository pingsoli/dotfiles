function fish_user_key_bindings

  # Tips: search key bindings use `fish_key_reader` command in fish.
  #
  # NOTE: make sure C-J binds nothing, or Enter and C-J will do the same thing.
  # When you press Enter and C-J will be triggered.

  if type -q "fzf"

    fzf_key_bindings

    # function fzf-bcd-widget -d 'cd backwards'
    #   pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | tac | eval (__fzfcmd) +m --select-1 --exit-0 $FZF_BCD_OPTS | read -l result
    #   [ "$result" ]; and cd $result
    #   commandline -f repaint
    # end
    # bind \cb fzf-bcd-widget

    function fs -d "Switch or attach to tmux session"
      if test -n "$TMUX"
        tmux list-sessions -F "#{session_name}" | fzf | read -l result; and tmux switch-client -t "$result"
      else
        tmux list-sessions -F "#{session_name}" | fzf | read -l result; and tmux attach -t "$result"
      end
    end

    # Remove fzf default key bindings
    bind --erase \ct
    bind --erase \cr
    bind --erase \ec
    bind --erase \ct -M insert
    bind --erase \cr -M insert
    bind --erase \ec -M insert

    # Rebind \b to disable fzf manipulate the key bindings
    # bind \b backward-delete-char

    # Rebind fzf default key bindings
    bind \cf fzf-file-widget
    bind \cr fzf-history-widget
    bind \co fzf-cd-widget

    bind \ct fs

  end

  # Allowing move around between word and char in fish terminal
  bind \ek forward-char
  bind \ej backward-char
  bind \el forward-word
  bind \eh backward-word

  # Avoid 'xsel: Can't open display: (null)...' error.
  bind --erase \cx
  bind --erase \cv

end
