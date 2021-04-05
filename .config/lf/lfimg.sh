#!/bin/sh
if [ -n "$DISPLAY" ]; then
  export FIFO_UEBERZUG="${TMPDIR:-/tmp}/lf-ueberzug-$$"

  cleanup() {
    exec 3>&-
    rm "$FIFO_UEBERZUG"
  }

  if [ -f "$FIFO_UEBERZUG" ]; then
    rm "$FIFO_UEBERZUG"
  fi
  mkfifo "$FIFO_UEBERZUG"
  ueberzug layer --silent <"$FIFO_UEBERZUG" &
  upid=$!
  exec 3>"$FIFO_UEBERZUG"
  trap cleanup EXIT

  if ! [ -d "$HOME/.cache/lf" ]; then
    mkdir -p "$HOME/.cache/lf"
  fi

  lf "$@" 3>&-
else
  lf "$@"
fi