#!/bin/bash

ROOT_DIR="test_directory"
mkdir -p $ROOT_DIR
mkdir -p $ROOT_DIR/dir1
mkdir -p $ROOT_DIR/dir2
touch $ROOT_DIR/file1.txt
touch $ROOT_DIR/file2.txt
touch $ROOT_DIR/dir1/file3.txt
touch $ROOT_DIR/dir2/file4.txt

ARCHIVE_NAME="test_archive.tar"
tar -cvf $ARCHIVE_NAME -C $ROOT_DIR .

if [ $? -ne 0 ]; then
  echo "Error in creating archive"
  exit 1
fi

EXTRACT_DIR="extracted"
mkdir $EXTRACT_DIR

tar -xvf $ARCHIVE_NAME -C $EXTRACT_DIR

if [ $? -ne 0 ]; then
  echo "Error in unpacking archive"
  exit 1
fi

compare_result=$(diff -qr "$ROOT_DIR" "$EXTRACT_DIR")

if [ -z "$compare_result" ]; then
  echo "Directories same"
else
  echo "Directories not same"
  echo "$compare_result"
fi

