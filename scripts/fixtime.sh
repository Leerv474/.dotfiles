#!/bin/sh

read -p "Change Hardware time? [y]es/[n]o: " confirm
		while [[ $confirm != "y" ]]; do
			if [[ $confirm == "n" ]]; then
				echo "Operation canceled."; exit 1
			else
				echo "I'm about to change Hardware time..."
				read -p "Type \"y\" to confirm or \"n\" to cancel: " confirm
			fi
		done
		if [[ $confirm != "y" ]]; then
         echo "Operation canceled."; exit 1
		fi

CURRENTTIME=$(timedatectl show --property=TimeUSec --value | awk '{print $3}')


# Extract hours, minutes, and seconds
IFS=':' read -r hours minutes seconds <<< "$CURRENTTIME"

# Convert time to seconds
total_seconds=$((hours * 3600 + minutes * 60 + seconds))

# Subtract 3 hours
total_seconds=$((total_seconds - 3 * 3600))

# Calculate new hours, minutes, and seconds
new_hours=$((total_seconds / 3600))
total_seconds=$((total_seconds % 3600))
new_minutes=$((total_seconds / 60))
new_seconds=$((total_seconds % 60))

# Format the new time
new_time=$(printf "%02d:%02d:%02d" "$new_hours" "$new_minutes" "$new_seconds")

CURRENTDATE=$(timedatectl show --property=TimeUSec --value | awk '{print $2}')

sudo timedatectl set-time "${CURRENTDATE} ${new_time}"
sudo timedatectl set-local-rtc 0
sudo hwclock --systohc --utc
