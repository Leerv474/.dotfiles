#!/bin/sh

 ### Colorful prompt
# colors
RESET='\[\033[0m\]'
BOLD='\[\033[1m\]'

# foreground
FBLUE='\[\[\033[38;2;138;173;244m\]'
FBASE='\[\033[38;2;30;30;46m\]'
FLAVENDER='\[\033[38;2;180;190;254m\]'
FSURFACE='\[\033[38;2;69;71;90m\]'
FGREEN='\[\033[38;2;64;160;43m\]'
FRED='\[\033[38;2;210;15;57m\]'

# background
BBLUE='\[\[\033[48;2;138;173;244m\]'
BSURFACE='\[\033[48;2;69;71;90m\]'
BLAVENDER='\[\033[48;2;180;190;254m\]'

# nerd characters 
LEFTF=''
RIGHTF=''
DIRICON=''
COMMANDICON=''
GIT=''
CHECK=''
CROSS=''

# Function to get Git branch name
parse_git_info() {
    # Check if Git is detected
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        return
    fi

    local branch=$(git branch 2> /dev/null | sed -n 's/^* //p')
    local status=$(git status --porcelain 2> /dev/null)

    if [ -n "$branch" ]; then
        if [[ "$status" == "" ]]; then
            echo -e "${BLAVENDER}${FBASE} ${GIT} ${branch} ${FGREEN}${CHECK}"
        else
            echo -e "${BLAVENDER}${FBASE} ${GIT} ${branch} ${FRED}${CROSS}"
        fi
    fi
}
PROMPT_DIRTRIM=3

update_prompt() {
    # Check if Git is detected 
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo -e "${FBLUE}${LEFTF}${FBASE}${BBLUE}${DIRICON}${RESET}${BSURFACE}${FBLUE}${RIGHTF}${BOLD} \w${RESET}${FSURFACE}${RIGHTF}${RESET}\n${FBLUE} ${COMMANDICON}${RESET} "
    else
        echo -e "${FBLUE}${LEFTF}${FBASE}${BBLUE}${DIRICON}${RESET}${BSURFACE}${FBLUE}${RIGHTF}${BOLD} \w${RESET}${BLAVENDER}${FSURFACE}${RIGHTF}${RESET}${FLAVENDER}${BOLD}$(parse_git_info)${RESET}${FLAVENDER}${RIGHTF}${RESET}\n${FBLUE} ${COMMANDICON}${RESET} "
    fi
}

update_prompt
