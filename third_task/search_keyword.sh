#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "$0 script needs 1 argument ключевое_слово"
  exit 1
fi

KEYWORD=$1

echo "Files with keyword '$KEYWORD':"
find . -type f -name "*$KEYWORD*"
