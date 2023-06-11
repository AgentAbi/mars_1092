#!/bin/bash

# Check if the password length is provided as an argument
if [ -z "$1" ]; then
  echo "Please provide the password length as an argument."
  exit 1
fi

# Generate the random password
password=$(openssl rand -base64 "$1" | tr -dc 'a-zA-Z0-9@#$%')

echo "Random password (using OpenSSL): $password"
