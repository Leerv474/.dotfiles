#!/bin/sh
# text colouring
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)
BLUE=$(tput setaf 4)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)

# --- ACQUIRING DATA ---
data_file="${HOME}/.psd_storage"
touch $data_file
declare -A hash_data

if [[ -e "$data_file" ]]; then
    while IFS= read -r line; do
        key="${line%%:*}"
        values="${line#*:}"
        hash_data["$key"]="$values"
    done < "$data_file"
fi

# --- FUNCTIONS ---
# CORE FUNCTIONS
# saving data
save_data() {
    temp_file="$.temp_data"
    touch $temp_file
    for key in "${!hash_data[@]}"; do
        echo "$key:${hash_data[$key]}" >> "$temp_file"
    done
    mv -f "$temp_file" "$data_file"
}

# USER FUNCTIONS
# add site data --add
add_data() {
    keys=("${!hash_data[@]}")
    for key in "${keys[@]}"; do
        if [ "$1" = "$key" ]; then
            echo -e "${RED}error:${NORMAL} $1 already exists"
            exit 1
        fi
    done

    read -p "> Enter login: " login
    
    read -p "> Enter password: " password

    if [ "$password" = "" ]; then
        echo -e "${RED}error:${NORMAL} no password was given"
        exit 1
    fi
    hash_data["$1"]="$login:$password"
    
    save_data
}

# get site data --get
get_data() {
    keys=("${!hash_data[@]}")
    key_found=0
    for ((i=0; i<${#keys[@]}; i++)) do
        key="${keys[$i]}"
        values="${hash_data["$key"]}"
        if [ "$1" = "$key" ]; then
            key_found=1
            break
        fi
    done

    if [ $key_found -eq 0 ]; then
        echo -e "${RED}error:${NORMAL} site was not found"
        exit 1
    fi

    IFS=: read -ra values_pair <<< "$values"
    echo -e "<1> to copy login\n<2> to copy password\n<q> to quit"

    while true; do
        read -s -n 1 button
        case "$button" in
            1)
                echo -n "${values_pair[0]}" | wl-copy
                ;;
            2)
                echo -n "${values_pair[1]}" | wl-copy
                ;;
            q | Q)
                exit 0
                ;;
        esac
    done
}

# edit site data --edit
edit_data() {
    keys=("${!hash_data[@]}")

    for ((i=0; i<${#keys[@]}; i++)) do
        key="${keys[$i]}"
        values="${hash_data["$key"]}"
        key_found=0
        if [ "$1" = "$key" ]; then
            key_found=1
            break
        fi
    done

    if [ $key_found -eq 0 ]; then
        echo -e "${RED}error:${NORMAL} site was not found"
        exit 1
    fi

    unchanged=0
    echo -e "${BLUE}info:${NORMAL} enter nothing to keep unchanged"

    read -p "> Enter new login: " login
    if [ "${login}" = "" ]; then
        values="${hash_data["$1"]}"
        IFS=: read -ra values_pair <<< "$values"
        login="${values_pair[0]}"
        ((unchanged++))
    fi

    read -p "> Enter new password: " password
    if [ "${password}" = "" ]; then
        values="${hash_data["$1"]}"
        IFS=: read -ra values_pair <<< "$values"
        password="${values_pair[1]}"
        ((unchanged++))
    fi

    if [ $unchanged -eq 2 ]; then
        echo -e "${BLUE}info:${NORMAL} unchanged"
        exit 0
    fi

    hash_data["$1"]="$login:$password"
    save_data
    echo -e "${BLUE}info:${NORMAL} saved"
    exit 0
}

# remove site data --remove
remove_data() {
    keys=("${!hash_data[@]}")
    key_found=0
    for ((i=0; i<${#keys[@]}; i++)) do
        key="${keys[$i]}"
        values="${hash_data["$key"]}"
        if [ "$1" = "$key" ]; then
            key_found=1
            break
        fi
    done

    if [ $key_found -eq 0 ]; then
        echo -e "${RED}error:${NORMAL} site was not found"
        exit 1
    fi

    unset hash_data["$1"]
    save_data
    echo -e "${BLUE}info:${NORMAL} $1 removed"
    exit 1
}

# --- USER OPTIONS ---
# no option
if [ "$#" -eq 0 ]; then
    echo -e "${RED}error:${NORMAL} no operation specified (use --help)\n"
    exit 1
fi

# --help
if [ "$1" = "--help" ]; then
    echo -e "${YELLOW}--- terminal password manager ---
${GREEN}usage:${NORMAL} psd <operation> [...]
${GREEN}operations:${NORMAL}
    psd --help
    psd --list
    psd get    [site_name]
    psd add    [site_name]
    psd edit   [site_name]
    psd remove [site_name]
    "
    exit 0
fi

# --list
if [ "$1" = "--list" ]; then
    keys=("${!hash_data[@]}")
    keys_num=${#keys[@]}

    echo -e "${BLUE}info:${NORMAL} total passwords stored - ${GREEN}${keys_num}${NORMAL}"

    for key in "${keys[@]}"; do
        echo -e "${key}"
    done
    exit 0
fi

# --get
if [ "$1" = "get" ]; then
    if [ "$#" -lt 2 ]; then
        echo -e "${RED}error:${NORMAL} no argument specified (use --help)\n"
        exit 1
    fi

    get_data $2
    exit 0
fi

# --add
if [ "$1" = "add" ]; then
    if [ "$#" -lt 2 ]; then
        echo -e "${RED}error:${NORMAL} no argument specified (use --help)\n"
        exit 1
    fi

    add_data $2
    exit 0
fi

# --edit
if [ "$1" = "edit" ]; then
    if [ "$#" -lt 2 ]; then
        echo -e "${RED}error:${NORMAL} no argument specified (use --help)\n"
        exit 1
    fi

    edit_data $2
    exit 0
fi

# --remove
if [ "$1" = "remove" ]; then
    if [ "$#" -lt 2 ]; then
        echo -e "${RED}error:${NORMAL} no argument specified (use --help)\n"
        exit 1
    fi

    remove_data $2
    exit 0
fi



# no command found
echo -e "${RED}error:${NORMAL} no such option (use --help)\n"
