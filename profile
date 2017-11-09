# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Add virtualenv created bin
if [ -d "$HOME/bin/py/bin" ] ; then
  PATH="$HOME/bin/py/bin:$PATH"
fi

# Add .local/bin https://docs.python.org/3/library/site.html#site.USER_BASE
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Add npm-global bin
if [ -d "$HOME/bin/npm-global/bin" ] ; then
  PATH="$HOME/bin/npm-global/bin:$PATH"
fi

# Set AWS_* environment variables with what was passed in by LC_* when sshing and SendEnv
# AWS access key.
AWS_ACCESS_KEY_ID="$LC_AWS_ACCESS_KEY_ID"

# AWS secret key. Access and secret key variables override credentials stored in credential and config files.
AWS_SECRET_ACCESS_KEY="$LC_AWS_SECRET_ACCESS_KEY"

# Specify a session token if you are using temporary security credentials.
#AWS_SESSION_TOKEN="$LC_AWS_SESSION_TOKEN"

# AWS region. This variable overrides the default region of the in-use profile, if set.
#AWS_DEFAULT_REGION="$LC_AWS_DEFAULT_REGION"

# Change the AWS CLI's output formatting to json, text, or table.
#AWS_DEFAULT_OUTPUT="$LC_AWS_DEFAULT_OUTPUT"

# name of the CLI profile to use. This can be the name of a profile stored in a credential or config file, or default to use the default profile.
#AWS_PROFILE="$LC_AWS_PROFILE"

# Specify the path to a certificate bundle to use for HTTPS certificate validation.
#AWS_CA_BUNDLE="$LC_AWS_CA_BUNDLE"

# Change the location of the file that the AWS CLI uses to store access keys.
#AWS_SHARED_CREDENTIALS_FILE="$LC_AWS_SHARED_CREDENTIALS_FILE"

# Change the location of the file that the AWS CLI uses to store configuration profiles.
#AWS_CONFIG_FILE="$LC_AWS_CONFIG_FILE"
