#!/bin/sh

__lf() {
  /home/ring/.config/lf/lfimg.sh "$@"
}

lfcd () {
    tmp="$(mktemp)"
    export LF_BACK="$(pwd)"
    __lf -last-dir-path="$tmp" "$@"
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

