#!/bin/bash 

# This is only meant to be used by me

set -euo pipefail

CONFIG=$(ls ./)
EXCLUDE=("arc-theme" "wallpapers" "LICENCE" "micro" "dolphinrc")
for dir in $CONFIG
do
  if [[ $dir =~ ^[a-zA-Z0-9]+\.[a-z]+$ || " ${EXCLUDE[@]} " =~ " ${dir} " ]]  ; then
    continue
  elif [[ -d ~/.config/$dir ]] ; then
    cp -r ~/.config/$dir ./ 
    continue
  elif [[ -d ~/$dir ]] ; then
    cp -r ~/$dir ./
    continue
  else
    cp ~/".$dir" ./"$dir"
    continue
  fi
done

echo ""
echo "Directory updated!"
echo ""
