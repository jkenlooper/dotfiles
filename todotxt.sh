#!/bin/bash

# https://github.com/ginatrapani/todo.txt-cli

cd $HOME/bin;

if [ -d todo.txt_cli-2.10 ]; then
  echo 'todo.txt_cli already installed?';
else
  curl https://github.com/ginatrapani/todo.txt-cli/releases/download/v2.10/todo.txt_cli-2.10.tar.gz -O -L
  tar -xf todo.txt_cli-2.10.tar.gz
  rm todo.txt_cli-2.10.tar.gz

  cd todo.txt_cli-2.10/
  ln todo.sh ../todo.sh
  chmod +x ../todo.sh
  sudo cp todo_completion /etc/bash_completion.d/todo
fi
