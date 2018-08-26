#!/usr/bin/env bash

# save and change IFS
OLDIFS=$IFS
IFS=$'\n'

# Make required directories
for kdeDir in $(find ./kde -type d); do
  #statements
  destDir="${HOME}${kdeDir##./kde}"
  mkdir -p "$destDir"
done

IFS=$'\n'
for kdeConfig in $(find ./kde -type f); do
  destFile="${HOME}${kdeConfig##./kde}"
  \cp "$kdeConfig" "$destFile"
done

# restore it
IFS=$OLDIFS
