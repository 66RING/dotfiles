#!/bin/sh

set -C -f -u 
IFS=$'\n'

# ANSI color codes are supported.
# STDIN is disabled, so interactive scripts won't work properly

# This script is considered a configuration file and must be updated manually.

# Meanings of exit codes:
# code | meaning    | action of ranger
# -----+------------+-------------------------------------------
# 0    | success    | Display stdout as preview
# 1    | no preview | Display no preview at all
# 2    | plain text | Display the plain content of the file

# Script arguments
FILE_PATH="${1}"         # Full path of the highlighted file

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER=$(echo ${FILE_EXTENSION} | tr '[:upper:]' '[:lower:]')

# Settings
HIGHLIGHT_SIZE_MAX=262143  # 256KiB
HIGHLIGHT_TABWIDTH=8
HIGHLIGHT_STYLE='pablo'
PYGMENTIZE_STYLE='autumn'

draw() {
  if [ -n "$FIFO_UEBERZUG" ]; then
    path="$(printf '%s' "$1" | sed 's/\\/\\\\/g;s/"/\\"/g')"
    printf '{"action": "add", "identifier": "preview", "x": %d, "y": %d, "width": %d, "height": %d, "scaler": "contain", "scaling_position_x": 0.5, "scaling_position_y": 0.5, "path": "%s"}\n' \
      "$4" "$5" "$2" "$3" "$1" >"$FIFO_UEBERZUG"
  fi
}

hash() {
  printf '%s/.cache/lf/%s' "$HOME" \
    "$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}')"
}

cache() {
  if [ -f "$1" ]; then
    draw "$@"
  fi
}


handle_extension() {
    case "${FILE_EXTENSION_LOWER}" in
        # Archive
        a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
            atool --list -- "${FILE_PATH}"
            bsdtar --list --file "${FILE_PATH}"
            exit 1;;
        rar)
            # Avoid password prompt by providing empty password
            unrar lt -p- -- "${FILE_PATH}"
            exit 1;;
        7z)
            # Avoid password prompt by providing empty password
            7z l -p -- "${FILE_PATH}"
            exit 1;;

        # PDF
        pdf)
            # Preview as text conversion
            pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - 
            mutool draw -F txt -i -- "${FILE_PATH}" 1-10 
            exiftool "${FILE_PATH}" 
            exit 1;;

        # BitTorrent
        torrent)
            transmission-show -- "${FILE_PATH}"
            exit 1;;

        # OpenDocument
        odt|ods|odp|sxw)
            # Preview as text conversion
            odt2txt "${FILE_PATH}"
            exit 1;;

        # HTML
        htm|html|xhtml)
            # Preview as text conversion
            w3m -dump "${FILE_PATH}"
            lynx -dump -- "${FILE_PATH}"
            elinks -dump "${FILE_PATH}" 
            ;; # Continue with next handler on failure

        ## JSON
        json)
            jq --color-output . "${FILE_PATH}" && exit 5
            python -m json.tool -- "${FILE_PATH}" && exit 5
            ;;

    esac
}

handle_mime() {
    local mimetype="$(file -Lb --mime-type -- "$FILE_PATH")"

    case "${mimetype}" in
        # Text
        text/* | */xml)
            # Syntax highlight
            if [ "$( stat --printf='%s' -- "${FILE_PATH}" )" -gt "${HIGHLIGHT_SIZE_MAX}" ]; then
                exit 2
            fi
            if [ "$( tput colors )" -ge 256 ]; then
                local pygmentize_format='terminal256'
                local highlight_format='xterm256'
            else
                local pygmentize_format='terminal'
                local highlight_format='ansi'
            fi
            highlight --replace-tabs="${HIGHLIGHT_TABWIDTH}" --out-format="${highlight_format}" \
                --style="${HIGHLIGHT_STYLE}" --force -- "${FILE_PATH}"
            # pygmentize -f "${pygmentize_format}" -O "style=${PYGMENTIZE_STYLE}" -- "${FILE_PATH}" 
            exit 2;;

        # Image
        image/*)
            shift
            orientation="$(identify -format '%[EXIF:Orientation]\n' -- "$FILE_PATH")"
            if [ -n "$orientation" ] && [ "$orientation" != 1 ]; then
              cache="$(hash "$FILE_PATH").jpg"
              cache "$cache" "$@"
              convert -- "$FILE_PATH" -auto-orient "$cache"
              draw "$cache" "$@"
            else
              draw "$FILE_PATH" "$@"
            fi
            file -Lb -- "$1" | fold -s -w "$width"
            exit 1;;

        # Video and audio
        video/* | audio/*|application/octet-stream)
            shift
            cache="$(hash "$FILE_PATH").jpg"
            cache "$cache" "$@"
            ffmpegthumbnailer -i "$FILE_PATH" -o "$cache" -s 0
            draw "$cache" "$@"
            file -Lb -- "$1" | fold -s -w "$width"
            exit 1;;
    esac
}

handle_fallback() {
    echo '----- File Type Classification -----' && file --dereference --brief -- "${FILE_PATH}"
    exit 1
}


handle_extension
handle_mime "$@"
handle_fallback

exit 1
