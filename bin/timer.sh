#!/bin/bash

# This is a simple pomodoro timer that updates a tmp file with the remaining
# pomodoro time.
#
# Usage (where 13 is a todo number): `timer.sh 13 &`
#
# This is a pretty simple thing. yup.

# Set to number of minutes to count down from.
if test -z $2; then
TIMER=25;
else
TIMER=$2;
fi

# Load the TASK variable with the todo text getting just the first line.
TASK=`sed -n ''"$1"' L' $TODO_FILE`;
echo "Starting timer for task: ${TASK}"

# Truncate it so the time left is at the end.
TASK=${TASK:0:34}

# Every minute update the txt file with the current todo and amount of time
# left.
while test $TIMER -gt -1; do
    echo "${TASK}... ${TIMER}" > ${HOME}/.tmp_timer.txt;
    TIMER=$(($TIMER-1));
    sleep 1m;
done
rm ${HOME}/.tmp_timer.txt;
