# dotfiles

Focus is on a remote dev environment with tmux and vim.

## Set up

On the host machine; set a alias to use when using ssh.  This alias makes it
easier to send the environment variables to the remote machine via `LC_`
namespacing.  On the remote machine the `.profile` sets the actual environment
variable via `SOMETHING="$LC_SOMETHING"`. I store all these env vars in a file
on the host machine which I then source in the alias.

`alias box='(source /path/to/my/environment-variables.sh; ssh jake@remote-box.example.com)'`

The environment-variables.sh sets variables like `LC_SOMETHING=llama` and then
`export` each. So, after ssh to the remote; the `SOMETHING` environment
variable will be set to the 'llama' string which is really useful.

Run the other install scripts on the remote machine.  See the
[box](https://github.com/jkenlooper/box) setup that should be somewhat loosely
followed first.

In this repo run the various install scripts or run `make`.  A lot of dot files
are made into symlinks from the home directory to this one (see install.sh).
