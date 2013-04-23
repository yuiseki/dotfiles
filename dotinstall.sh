#!/bin/bash

echo -e " - link dot files\n"
for file in `ls -a`
do
	if [[ "$file" =~ ^..?(git|gitignore|gitmodules)?$ ]]\
	 || [[ "$file" =~ .*swp ]]\
	 || [[ "$file" = "dotinstall.sh" ]]\
	 || [[ "$file" = "mkdirs.sh" ]]\
	 || [[ "$file" = "README.md" ]]; then
		continue
	fi

	if [[ -a $HOME/$file ]]; then
		mv $HOME/$file $HOME/trash
	fi

	echo $file
	ln -s $HOME/dotfiles/$file $HOME/$file
done

git submodule init
git submodule update

# 
# git rm --cached path/to/hoge

