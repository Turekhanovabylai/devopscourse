#!/bin/bash

file_count=0
dir_count=0

for item in *; do
  if [ -f "$item" ]; then
    file_count=$((file_count + 1))
  elif [ -d "$item" ]; then
    dir_count=$((dir_count + 1))
  fi
done

echo "Files count: $file_count"
echo "Directories count: $dir_count"
