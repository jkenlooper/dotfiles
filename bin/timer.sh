#!/bin/bash

# This is a simple pomodoro timer that updates a tmp file with the remaining
# pomodoro time.
#
# Usage (where 13 is a todo number): `timer.sh 13 &`
#

# Set to number of minutes to count down from.
TIMER=25;

# Load the TASK variable with the todo text getting just the first line.
TASK=`todo.sh ls $1 | head -n 1`;

# Failed attempt at removing the first digits for the todo.  Which actually is
# better to keep them.
#TASK=${TASK/[[:digit:]]}

# Truncate it so the time left is at the end.
TASK=${TASK:0:34}

# Every minute update the txt file with the current todo and amount of time
# left.
while test $TIMER -gt -1; do
    echo "${TASK}... ${TIMER}" > ${HOME}/.tmp_timer.txt;
    TIMER=$(($TIMER-1));
    sleep 1m;
done
