#!/bin/bash

dirs=( \
  "var" "tmp" "src" "mnt"\
  "scripts" "repos" "workspace"\
  "trash" "data" "fluent"\
  "node_modules" \
  )

echo -e " - make default dirs\n"
for dir in "${dirs[@]}"
do
	if [[ -a $HOME/$dir ]]; then
		continue
	fi
	echo $dir
	mkdir $HOME/$dir
done
