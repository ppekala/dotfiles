#!/bin/sh

srcdir=$(realpath "${0%/*}")
homedir=$(realpath "$HOME")
confdir=${srcdir#$homedir/}

osname=$(uname -s)
if [ "$osname" = "FreeBSD" ]; then
	sudo pkg install dfc exa most mutt vim zsh ydiff
fi

cd "$HOME"
for config in conkyrc mostrc muttrc vimrc zshrc; do
	[ -e .$config ] || ln -sv "$confdir/$config" .$config
done

if ! which git >/dev/null; then
	echo "Git not found, skipping Vundle VIM plugin install."
	exit
fi
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
	echo "Downloading Vundle VIM plugin..."
	git clone https://github.com/VundleVim/Vundle.vim.git \
	       "$HOME/.vim/bundle/Vundle.vim"
	if [ $? -eq 0 ]; then
		echo "Vundle installed, do :PluginInstall in vim to install other plugins."
	else
		echo "Vundle install failed."
	fi
fi
