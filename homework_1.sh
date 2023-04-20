#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 directory_path"
  exit 1
fi

if [ ! -d $1 ]; then
  echo "$1 is not a directory"
  exit 1
fi


for file in "$1"/*; do
  if [[ -f "$file" ]]; then
    extension=${file##*.}
    if [[ ! -d "$1/$extension" ]]; then
      mkdir "$1/$extension"
    fi
    mv "$file" "$1/$extension"
  fi
done
