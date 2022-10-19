#!/bin/sh

__lf() {
  if [ -n "$DISPLAY" ]; then
    export FIFO_UEBERZUG="${TMPDIR:-/tmp}/lf-ueberzug-$$"

    cleanup() {
      exec 3>&-
      rm "$FIFO_UEBERZUG"
    }

    if [ -f "$FIFO_UEBERZUG" ]; then
      rm "$FIFO_UEBERZUG"
    fi
    mkfifo "$FIFO_UEBERZUG" 2> /dev/null
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
}

lfcd () {
    tmp="$(mktemp)"
    export LF_BACK="$(pwd)"
    (GOTRACEBACK=crash __lf -last-dir-path="$tmp" "$@")
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        unset LF_BACK
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                pushd "$dir" > /dev/null
            fi
        fi
    fi
}

