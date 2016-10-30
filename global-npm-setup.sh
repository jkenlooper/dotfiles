#!/bin/bash

# Setup npm to use a different directory for global installs
rm -rf $HOME/bin/npm-global;
mkdir -p $HOME/bin/npm-global;
npm config set prefix '~/bin/npm-global';
