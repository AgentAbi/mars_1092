#!/bin/bash

# Checking if the "Modified" directory exists
modified_dir="modified"
if [ ! -d "$modified_dir" ]; then
  echo "Directory '$modified_dir' does not exist."
  exit 1
fi

# Get the current date and time
current_date=$(date +"%Y-%m-%d")
current_time=$(date +"%H:%M:%S")

# Iterate over each file in the "Modified" directory
for file in "$modified_dir"/*; do
  if [ -f "$file" ]; then
    # Append the current date and time to the file
    echo -e "\nCurrent Date: $current_date" >> "$file"
    echo "Current Time: $current_time" >> "$file"
    echo "Date and time appended to '$file'."
  fi
done
