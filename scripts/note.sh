#!/bin/sh

NOTEPATH="${HOME}/Documents/Notes"
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NORMAL='\033[0m'
BLUE='\033[0;34m'

if [ "$#" -eq 0 ]; then
    selected_file=$(fd --search-path "${NOTEPATH}" --type f | fzf --preview="bat --color="always" --style="plain" {}")
    if [ $? -eq 0 ]; then
        nvim "$selected_file"
    else
        echo -e "${BLUE}info:${NORMAL} no file selected" 
    fi
    exit 0
fi

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo -e "${YELLOW}--- quick notes ---
${GREEN}usage:${NORMAL} note <operation>
${GREEN}operations:${NORMAL}
    note --help
    note (open note)
    note -n [filename] (new note)
    note -r (remove note)
    note -g (save to git)
    "
    exit 0
fi

if [ "$1" = '-r' ]; then
    selected_file=$(fd --search-path "${NOTEPATH}" --type f | fzf)
    if [ $? -eq 0 ] && [ -n "$selected_file" ]; then
        echo -e "Are you sure you want to delete ${selected_file}? (Y/n): "
        read confirm
        if [[ "$confirm" = 'y' || "$confirm" = 'Y' || "$confirm" = '' ]]; then
            rm "$selected_file"
            echo -e "${BLUE}info:${NORMAL} note ${selected_file} removed"
        else
            echo -e "${BLUE}info:${NORMAL} action cancelled"
            exit 0
        fi  
    else
        echo -e "${BLUE}info:${NORMAL} no file selected" 
    fi
    exit 0
fi

if [ "$1" = '-g' ]; then
    git -C ~/Documents/Notes commit -m "update"
    git -C ~/Documents/Notes push
    exit
fi

if [ "$#" -ne 2 ]; then
    echo -e "${RED}error:${NORMAL} bad argument (use --help)"
    exit 1
fi
if [ "$1" = '-n' ]; then
    if [[ "$2" == *"."* ]]; then
        echo -e "${RED}error:${NORMAL} note name should not have an extension"
    fi
    touch "${NOTEPATH}/${2}.md"
    nvim "${NOTEPATH}/${2}.md"
    echo -e "${BLUE}info:${NORMAL} note ${NOTEPATH}/${2} created"
    exit 0
fi


echo -e "${RED}error:${NORMAL} no operation specified (use --help)"
exit 1

