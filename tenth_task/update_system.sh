#!/bin/bash

sudo apt update

updates=$(apt list --upgradable 2>/dev/null | grep -v "Listing" | wc -l)

if [ "$updates" -eq 0 ]; then
  echo "Updates not found"
else
  echo "Updates found: $updates"
  echo "Installing updates..."
  sudo apt upgrade -y
  echo "Updates sucessfully installed"
fi

# Этот скрипт в интернете подсмотрел, проверять его не захотел чтоб ничего не полетело локально у меня после обновлений
