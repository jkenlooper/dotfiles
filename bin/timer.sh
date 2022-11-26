#!/usr/bin/env bash

trap "rm -f ${HOME}/.tmp_timer.txt" EXIT

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
#TASK=${TASK:0:34}

printf "\n%s" "${TASK}" > ${HOME}/session.chat.txt
while test $TIMER -gt 0; do
  printf " :%s" "$TIMER" > ${HOME}/.tmp_timer.txt
  TIMER=$(($TIMER-1))
  sleep 60
done
printf " :%s" "$TIMER" > ${HOME}/.tmp_timer.txt

message_ui() {
  if hash terminal-notifier 2>/dev/null; then
    terminal-notifier -message "$1" -timeout 7 -activate com.apple.Terminal
  elif hash notify-send 2>/dev/null; then
    notify-send --urgency critical --expire-time=7000 "$1";
  fi
  tmux display-message "$1";
}

message_ui "Timer finished: ${TASK}"
sleep 10
