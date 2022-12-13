#!/usr/bin/env bash

trap 'rm -f "$HOME/.tmp_timer.txt"' EXIT

# This is a simple pomodoro timer that updates a tmp file with the remaining
# pomodoro time.

# Set to number of minutes to count down from.
TIMER=${1-25}

task="$(cat "$HOME/session.chat.txt" | xargs | grep -o -E '.{0,160}$')"
echo "Enter task:"
echo "[$task]"
read -r updatetask
if [ -n "$updatetask" ]; then
  task="$updatetask"
fi
echo "Starting timer for task: ${task}"

printf "\n%s" "${task}" > "$HOME/session.chat.txt"
while test "$TIMER" -gt 0; do
  printf " :%s" "$TIMER" > "$HOME/.tmp_timer.txt"
  TIMER=$((TIMER-1))
  sleep 60
done
printf " :%s" "$TIMER" > "$HOME/.tmp_timer.txt"

message_ui() {
  if hash terminal-notifier 2>/dev/null; then
    terminal-notifier -message "$1" -timeout 7 -activate com.apple.Terminal
  elif hash notify-send 2>/dev/null; then
    notify-send --urgency critical --expire-time=7000 "$1";
  fi
  tmux display-message "$1";
}

message_ui "$(date '+%H:%M') Timer finished: ${task}"
printf "\n  %s" "$(date '+%H:%M')" >> "$HOME/session.chat.txt"
