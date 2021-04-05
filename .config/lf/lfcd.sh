#!/bin/sh

_lf () {
    tmp="$(mktemp)"
    export LF_BACK="$(pwd)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        unset LF_BACK
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}


lfcd() {
  set +m 
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

    _lf "$@" 3>&-
  else
    _lf "$@"
  fi
  # kill $upid &
  # wait $upid
  # set -m
}
