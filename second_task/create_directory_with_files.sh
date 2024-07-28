#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "$0 script needs 2 arguments directory's name and number of files"
  exit 1
fi

DIRECTORY=$1
NUM_FILES=$2

if ! [[ "$NUM_FILES" =~ ^[0-9]+$ ]] || [ "$NUM_FILES" -le 0 ]; then
  echo "number of files must be positive number"
  exit 1
fi

mkdir -p "$DIRECTORY"

EXTENSIONS=("txt" "md" "json" "xml" "csv" "pdf" "png" "sh")
NUM_EXTENSIONS=${#EXTENSIONS[@]}

for ((i=1; i<=NUM_FILES; i++)); do
  EXTENSION=${EXTENSIONS[((i-1) % NUM_EXTENSIONS)]}
  touch "$DIRECTORY/file${i}.${EXTENSION}"
done

echo "Directory '$DIRECTORY' and $NUM_FILES files successfully created"
