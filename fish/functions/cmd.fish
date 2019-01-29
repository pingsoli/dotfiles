function cmd --description "create and change to the given directory"
  command mkdir -p $argv; and cd $argv;
end
