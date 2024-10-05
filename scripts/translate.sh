#!/bin/sh

if [[ "$#" -eq 0 ]]; then
    echo -e "no argument was passed"
    exit 1
fi

TRANSLATE_URL="https://translate.google.com/?sl=en&tl=ru&text=WORD&op=translate"
TRANSLATE_WORD_URL="${TRANSLATE_URL//WORD/$1}"

firefox $TRANSLATE_WORD_URL
