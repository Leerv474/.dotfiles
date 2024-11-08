#!/bin/sh
horizontal_line="─"
vertical_line="│"
left_top="╭"
left_bottom="╰"
right_top="╮"
right_bottom="╯"
title="󱅄 TODO"

TODO_FILE="$HOME/.todo"
if [[ ! -f "$TODO_FILE" ]]; then
    echo "The todo file does not exist."
    exit 1
fi

todo_list() {
    if [[ ! -s "$TODO_FILE" ]]; then
        exit 0
    fi

    max_length=0
    while IFS= read -r line; do
        if [ ${#line} -gt $max_length ]; then
            max_length=${#line}
        fi
    done < "$TODO_FILE"

    title_length=${#title}
    padding_length=$(( (max_length - title_length + 6) / 2 ))

    echo -n "$left_top"
    for ((i = 0; i < padding_length; i++)); do
        echo -n "$horizontal_line"
    done
    echo -n " $title "
    for ((i = 0; i < max_length + 8 - padding_length - title_length; i++)); do
        echo -n "$horizontal_line"
    done
    echo "$right_top"

    line_number=1
    while IFS= read -r line; do
        line_length=${#line}
        total_length=$((max_length + 2))

        spaces_needed=$((total_length - line_length - ${#line_number} + 3))
        spaces_string=$(printf "%${spaces_needed}s" "")

        printf "%s %d. %s %s %s\n" "$vertical_line" "${line_number}" "$line" "$spaces_string" "$vertical_line"

        ((line_number++))
    done < "$TODO_FILE"

    echo -n "$left_bottom"
    for ((i = 0; i < max_length + 10; i++)); do
        echo -n "$horizontal_line"
    done
    echo "$right_bottom"

    exit 0
}
if [[ "$#" -eq 0 ]]; then
    todo_list
fi

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --help)
            echo "Usage: todo.sh [--check line_number | --new \"task\" | --help]"
            echo "--check line_number : Check (remove) a task by its line number"
            echo "--new \"task\" : Add a new task to the TODO list"
            echo "--help : Display this help message"
            exit 0
            ;;
        check)
            shift
            if [[ -z "$1" || ! "$1" =~ ^[0-9]+$ ]]; then
                echo "Error: Please provide a valid line number after --check."
                exit 1
            fi

            line_to_remove=$1
            total_lines=$(wc -l < "$TODO_FILE")

            if (( line_to_remove < 1 || line_to_remove > total_lines )); then
                echo "Error: Line number out of range. There are only $total_lines lines in the TODO list."
                exit 1
            fi

            sed -i.bak "${line_to_remove}d" "$TODO_FILE"
            todo_list
            exit 0
            ;;
        new)
            shift
            if [[ -z "$1" ]]; then
                echo "Error: Please provide a task description after --new."
                exit 1
            fi

            task_description="$*"
            echo "$task_description" >> "$TODO_FILE"
            todo_list
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

