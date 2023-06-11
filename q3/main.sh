#!/bin/bash

# Check if the password length is provided as an argument
if [ -z "$1" ]; then
  echo "Please provide the password length as an argument."
  exit 1
fi

# Set the character set for the password
charset="A-Za-z0-9@#$%"

# Generate the random password
password=$(tr -dc "$charset" < /dev/urandom | head -c "$1")

echo "Random password (using /dev/urandom): $password"
