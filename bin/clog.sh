#!/bin/bash

# Simple script to run in the background that will sleep for 25 minutes and
# then prompt to add an entry to the journal.

TIMEOUT=${1:-25}; # Default to 25 minutes if no arg passed

message_ui() {
    if hash terminal-notifier 2>/dev/null; then
        terminal-notifier -message "C Log" -timeout 7 -activate com.apple.Terminal
    elif hash notify-send 2>/dev/null; then
      notify-send --urgency critical --expire-time=7000 "C Log";
    fi
    tmux display-message "C Log";
}

while true; do
  sleep $(echo "60 * $TIMEOUT" | bc)
  tmux split-window -v -l 5 'journal'
  message_ui "C Log"
  watchit ~/.journal/
done;
