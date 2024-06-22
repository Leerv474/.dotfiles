#!/bin/bash

# Function to calculate padding for centering
calculate_padding() {
    local right_len=$1
    local left_len=$2
    local padding=$(( ($right_len - $left_len) ))
    echo $padding
}

# Main function
main() {
    # Get current time and date
    local weekday=$(date +"%A")
    local hours=$(date +"%H")
    local minutes=$(date +"%M")
    local date=$(date +"%d.%m.%Y")
    local left_str="$weekday | $hours"
    local right_str="$minutes | $date"
    local formatted_string="${left_str}:${right_str}"

    local padding=$(calculate_padding ${#right_str} ${#left_str})

    # Add padding to the left of the string
    printf "%*s%s\n" "$padding" "" "$formatted_string"
}

main

