#!/bin/sh
BLUE="\033[34m"
RED='\033[0;31m'
RESET="\033[0m" 
GREEN='\033[0;32m'

BRANCH="$(git status | grep "On branch")"
TRACKS="$(git status --short)"

    #echo -e "[${BLUE}info${RESET}]: "
if [[ -z $BRANCH  ]]; then
    echo -e "[${RED}error${RESET}]: not a git repository"
    exit
fi

branch_name=$(git branch --show-current)
echo -e "On branch ${GREEN}${branch_name}${RESET}"
if [[ -z ${TRACKS} ]]; then
    echo -e "[${BLUE}info${RESET}]: nothing to be committed"
    exit
fi
    
echo -e "Changes: "
git status --short

echo -e "[${BLUE}info\033[0m]: do you want to commit this? [Y/n]: \c" 
read confirm
if [[ $confirm = 'y' || $confirm = 'Y' || $confirm = '' ]]; then
    echo -e "[${BLUE}info\033[0m]: adding files\n..."
    git add .
    commit_msg="quick-git update"
    echo -e "[${BLUE}info\033[0m]: committing by name \"${commit_msg}\""
    git commit -m "${commit_msg}"
    echo -e "[${BLUE}info\033[0m]: pushing files"
    git push
else
    echo -e "[${BLUE}info\033[0m]: cancelled"
fi

