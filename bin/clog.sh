#!/bin/bash

# Simple script to run in the background that will sleep for 25 minutes and
# then prompt to add an entry to the journal.  A screenshot will also be taken
# after the entry has been made.

# Suggested way of running:
# nohup clog.sh > clog.output &

TIMEOUT=${1:-25}; # Default to 25 minutes if no arg passed

message_ui() {
    if hash terminal-notifier 2>/dev/null; then
        terminal-notifier -message $1 -timeout 7 -activate com.apple.Terminal
    elif hash notify-send 2>/dev/null; then
      notify-send --urgency critical --expire-time=7000 $1;
    fi
    tmux display-message $1;
}

screenshot() {
    if hash import; then
      # import command is from imagemagick
      sleep 5
      import -silent -window root $(date "+$HOME/.journal/%Y.%m.%d-%H%M%S.png")
    elif hash gnome-screenshot 2>/dev/null; then
      gnome-screenshot --include-pointer --delay=5 --file=`date "+$HOME/.journal/%Y.%m.%d-%H%M%S.png"`
    elif hash screencapture 2>/dev/null; then
      screencapture -mCx -T5 `date "+$HOME/.journal/%Y.%m.%d-%H%M%S.png"`
    fi
}

while true; do
  sleep $(echo "60 * $TIMEOUT" | bc)
  tmux split-window -v -l 5 'journal'
  message_ui "C Log"
  watchit ~/.journal/
  screenshot
done;
