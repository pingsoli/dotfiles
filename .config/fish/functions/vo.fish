function vo -d "vim open vim|fish|tmux|ycm conf file with horizontal layout"
  set -l openfiles
  for option in $argv
    switch $option
      case vi vim
       set -l vim_conf_file ~/.vimrc
       set openfiles $openfiles $vim_conf_file

      case tmux
       set -l tmux_conf_file ~/.tmux.conf
       set openfiles $openfiles $tmux_conf_file

      case fish
       set -l fish_conf_file ~/.config/fish/config.fish
       set openfiles $openfiles $fish_conf_file

      case ycm
        set -l ycm_conf_file $HOME/.vim/.ycm_extra_conf.py

        if test -e "$ycm_conf_file"
          set openfiles $openfiles $ycm_conf_file
        else
          set_color red
          printf "ERROR: not found ycm conf file"
          set_color normal
        end

      case '*'
        set_color red
        printf "ERROR: Unknown option %s\n" $option
        set_color normal
        return 1
    end
  end

  # open all files with horizontal layout
  command vim -O $openfiles
end
