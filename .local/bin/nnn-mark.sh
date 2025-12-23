#!/bin/bash

MARK_FILE="$HOME/.config/nnn/mark"

case "$1" in
"mark")
  pwd >"$MARK_FILE"
  ;;
"jump")
  if [ -f "$MARK_FILE" ]; then
    # Output the marked directory for nnn to cd into
    cat "$MARK_FILE"
  fi
  ;;
esac
