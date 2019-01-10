function cmd --description "create and change to the given directory"
  if not test -e "./$argv"
    mkdir "$argv"
  end
  cd "$argv"
end
