#!/usr/bin/env fish

function cmd --description "Create and change to the given directory"
  command mkdir -p $argv; and cd $argv;
end
