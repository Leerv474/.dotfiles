#!/bin/bash

BASE_DIR="$HOME/Dev"

SELECTED_DIR=$(fd --max-depth 1 --type d . "$BASE_DIR" | fzf-tmux -p)
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NORMAL='\033[0m'
BLUE='\033[0;34m'

if [[ -z "$SELECTED_DIR" ]]; then
    echo -e "${RED}error:${NORMAL} No directory selected."
    exit 1
fi

DIR_NAME=$(basename "$SELECTED_DIR")

if tmux has-session -t "$DIR_NAME" 2>/dev/null; then
    echo -e "${YELLOW}warn:${NORMAL} Session already exists"
    exit 1;
fi

if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$DIR_NAME" 2>/dev/null || {
        tmux new-session -d -s "$DIR_NAME" -c "$SELECTED_DIR" -n code
        tmux new-window -t "$DIR_NAME" -c "$SELECTED_DIR" -n server
        tmux select-window -t "$DIR_NAME:code"
        tmux send-keys -t "$DIR_NAME:code" "nvim ." C-m
        tmux switch-client -t "$DIR_NAME"
    }
    exit 0
fi

tmux new-session -d -s "$DIR_NAME" -c "$SELECTED_DIR" -n code
tmux new-window -t "$DIR_NAME" -c "$SELECTED_DIR" -n server
tmux select-window -t "$DIR_NAME:code"
tmux send-keys -t "$DIR_NAME:code" "nvim ." C-m
tmux attach-session -t "$DIR_NAME"
