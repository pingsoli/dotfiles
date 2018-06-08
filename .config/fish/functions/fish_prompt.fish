function fish_prompt
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')

  echo -n (prompt_pwd)

  if test -n "$git_branch"
    set_color blue;   echo -n "("; set_color normal;

    switch "$git_branch"
      case "*detached*"
        set_color red; echo -n "detached"; set_color normal;
      case '*'
        set_color yellow; echo -n $git_branch; set_color normal;
    end

    set_color blue;   echo -n ")"; set_color normal;
  end

  echo -n " \$ "
end
