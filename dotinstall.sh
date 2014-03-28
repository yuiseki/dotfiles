#!/bin/bash

echo -e " - link dot files\n"
mkdir $HOME/old
for file in `ls -a`
do
	if [[ "$file" =~ ^..?(bin|playbooks|git|gitignore|gitmodules)?$ ]]\
	 || [[ "$file" =~ .*swp ]]\
	 || [[ "$file" = "dotinstall.sh" ]]\
	 || [[ "$file" = "apt-install-ansible.sh" ]]\
	 || [[ "$file" = "README.md" ]]; then
		continue
	fi

	if [[ -a $HOME/$file ]]; then
		mv $HOME/$file $HOME/old/
	fi

	echo $file
	ln -s $HOME/dotfiles/$file $HOME/$file
done

git submodule init
git submodule update

# 
# git rm --cached path/to/hoge

