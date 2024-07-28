#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "$0 script needs 1 argument file name"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "file $1 does not exist"
  exit 1
fi

word_count=$(wc -w < "$1")
echo "word count in file $1: $word_count"
