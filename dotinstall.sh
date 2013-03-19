#!/bin/bash

echo -e " - make default dirs\n"
for dir in `cat mkdir_list`
do
	if [[ -a $HOME/$dir ]]; then
		continue
	fi
	echo $dir
	mkdir $HOME/$dir
done

echo -e "\n"

echo -e " - link dot files\n"
for file in `ls -a`
do
	if [[ "$file" =~ ^..?(git|gitignore|gitmodules)?$ ]]\
	 || [[ "$file" =~ .*swp ]]\
	 || [[ "$file" = "dotinstall.sh" ]]\
	 || [[ "$file" = "README.md" ]]\
	 || [[ "$file" = "mkdir_list" ]]; then
		continue
	fi

	if [[ -a $HOME/$file ]]; then
		mv $HOME/$file $HOME/trash
	fi

	echo $file
	ln -s $HOME/dotfiles/$file $HOME/$file
done
