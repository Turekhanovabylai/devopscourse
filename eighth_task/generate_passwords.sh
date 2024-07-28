#!/bin/bash

if [ $# -ne 1 ]; then
  echo "$0 script needs 1 argument password length"
  exit 1
fi

length=$1
output_file="passwords.txt"

password=$(LC_ALL=C tr -dc 'A-Za-z0-9' < /dev/urandom | head -c $length)
echo $password >> $output_file

echo "Password saved in file $output_file"
