#!/bin/bash

# This is a simple pomodoro timer that updates a tmp file with the remaining
# pomodoro time.

# Set to number of minutes to count down from.
TIMER=${2-25}

# Load the TASK variable with the todo text getting just the first line.
TASK="$(todo.sh -p ls $1 | head -n1)"
TASKNUMBER="$(echo $TASK | cut -f 1 -d ' ')"
TASK=${TASK#${TASKNUMBER} }
echo "Starting timer for task: ${TASK}"

# Truncate it so the time left is at the end.
TASK=${TASK:0:34}

# Every minute update the txt file with the current todo and amount of time
# left.
while test $TIMER -gt -1; do
  echo "${TASK}... ${TIMER}" > ${HOME}/.tmp_timer.txt
  cat ${HOME}/.tmp_timer.txt
  TIMER=$(($TIMER-1))
  sleep 1m
done
rm ${HOME}/.tmp_timer.txt;
