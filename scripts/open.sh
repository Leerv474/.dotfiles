#/bin/sh

if ! [[ "${#}" -eq 1 ]]; then
    exit 1
fi

xdg-open "$1" &
