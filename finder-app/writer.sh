#!/bin/bash

file_directory=$1
base_name="${file_directory%/*}/"
file_name="${file_directory##*/}"

if [ $# -eq 0 ];
then
  echo "$0: Missing arguments"
  exit 1
elif [ $# -gt 2 ];
then
  echo "$0: Too many arguments: $@"
  exit 1
elif [ -e $1 ]; 
then
  echo $2 > $1
elif [ -d $base_name ];
then
  echo $2 > "${base_name}${file_name}"
elif [ ! -d $base_name ];
then
  mkdir -p "$base_name"
  echo $2 > "${base_name}${file_name}"
else
  echo "file could not be created"
fi
