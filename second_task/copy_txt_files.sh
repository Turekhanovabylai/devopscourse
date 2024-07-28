#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "$0 script needs 2 arguments - source directory and target directory"
  exit 1
fi

SOURCE_DIRECTORY=$1
TARGET_DIRECTORY=$2

if [ ! -d "$SOURCE_DIRECTORY" ]; then
  echo "Source directory does not exist: $SOURCE_DIRECTORY"
  exit 1
fi

if [ ! -d "$TARGET_DIRECTORY" ]; then
  mkdir -p "$TARGET_DIRECTORY"
fi

cp "$SOURCE_DIRECTORY"/*.txt "$TARGET_DIRECTORY"

echo "Copied files:"
ls -la "$SOURCE_DIRECTORY"/*.txt
