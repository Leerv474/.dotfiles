#!/bin/sh

if [ "${#}" -ne 1 ] || [ -d "$1" ] || ! [ -e "$1" ]; then
    exit 1
fi

MIME_TYPE=$(xdg-mime query filetype "$1")
DEFAULT_APP=$(grep "^$MIME_TYPE=" ~/.local/share/applications/mimeapps.list /usr/share/applications/mimeapps.list 2>/dev/null | head -n 1 | cut -d '=' -f 2)

if [ "$DEFAULT_APP" = "nvim.desktop" ]; then
    nvim "$1"
    exit 0
fi

xdg-open "$1" &>/dev/null &

