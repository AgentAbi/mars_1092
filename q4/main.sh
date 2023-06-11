#!/bin/bash

# Check if the file name is provided as an argument
if [ -z "$1" ]; then
  echo "Please provide the file name as an argument."
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "File '$1' does not exist."
  exit 1
fi

# Read the matrix from the file into an array
readarray -t lines < "$1"

# Get the number of rows and columns in the matrix
num_rows=${#lines[@]}
num_cols=$(echo "${lines[0]}" | wc -w)

# Create an empty transposed matrix
declare -A transposed_matrix

# Transpose the matrix
for ((i = 0; i < num_rows; i++)); do
  line="${lines[i]}"
  read -ra values <<< "$line"

  for ((j = 0; j < num_cols; j++)); do
    transposed_matrix[$j,$i]=${values[j]}
  done
done

# Print the transposed matrix in standard 2D matrix format
for ((i = 0; i < num_cols; i++)); do
  for ((j = 0; j < num_rows; j++)); do
    echo -n "${transposed_matrix[$i,$j]} "
  done
  echo
done
