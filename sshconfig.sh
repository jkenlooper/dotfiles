# Set the box alias for ssh in to box-1 and passing in AWS environment vars that are set in set_aws_keys.sh
alias box='(source ~/.ssh/set_aws_keys.sh; ssh jake@box-1)'

# set_aws_keys.sh example
LC_AWS_KEY_TEST=secretkey
export LC_AWS_KEY_TEST

LC_AWS_PUBLIC_KEY_TEST=publickey
export LC_AWS_PUBLIC_KEY_TEST
