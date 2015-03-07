#!/bin/bash

(
mkdir -p todo.actions.d;
mkdir -p $HOME/sources;
cd $HOME/sources;
git clone https://github.com/ginatrapani/todo.txt-cli;
cd todo.txt-cli;
sudo make install;
)
