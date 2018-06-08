set -gx MY_WORKSPACE $HOME/workspace

function cdw --description 'Change directory quickly'
	if test -e "$MY_WORKSPACE/$argv"
    cd "$MY_WORKSPACE/$argv"
  else
    set_color red
    echo "ERROR: $MY_WORKSPACE/$argv directory not exists"
    set_color normal
  end
end
