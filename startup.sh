#!/usr/bin/env -S bash -o errexit

# After logging in run this script to initialize

read -p "Enter git config user name: [$(git config --global user.name)]" STARTUP_GIT_CONFIG_USER_NAME

if test "$STARTUP_GIT_CONFIG_USER_NAME"; then
  git config --global --replace-all user.name $STARTUP_GIT_CONFIG_USER_NAME;
fi

read -p "Enter git config user email: [$(git config --global user.email)]" STARTUP_GIT_CONFIG_USER_EMAIL

if test "$STARTUP_GIT_CONFIG_USER_EMAIL"; then
  git config --global --replace-all user.email $STARTUP_GIT_CONFIG_USER_EMAIL;
fi
