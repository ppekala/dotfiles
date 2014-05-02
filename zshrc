
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

zstyle :compinstall filename '/home/corn/.zshrc'

autoload -U colors && colors
autoload -Uz compinit && compinit

setopt autocd
setopt nobeep

PS1="%{${fg[green]}%}%B[%m@%~]%#%b "

export BLOCKSIZE="K"
export CVS_OPTIONS="-z 6 -q"
export CVS_RSH="ssh"
export EDITOR="vim"
export FREEBSD_LOGIN="pawel"
export H="${HOME}"
export LESS="--clear-screen --quit-if-one-screen --ignore-case --SILENT --chop-long-lines --tabs=3"
export LSCOLORS="Exfxcxdxbxegedabagacad"
export PAGER="less"
export PMK="/usr/ports/Mk"
export PSVN="svn-lite"
export TBCONF="/usr/local/tinderbox/scripts/etc/env/GLOBAL"
export TBDIR="/usr/local/tinderbox"
export TOP="-PI"

PATH="${PATH}:/usr/ports/Tools/scripts"
if [ $UID -ne 0 -a -n "$(id | grep wheel)" ]; then
	PATH="${PATH}:/sbin:/usr/sbin:/usr/local/sbin"
	alias spkg="sudo pkg"
fi
[ -d "${HOME}/bin" ] && PATH="${PATH}:${HOME}/bin"
export PATH

alias del="rm -i"
alias df="df -h"
alias du="du -h"
alias ll="ls -Glh"
alias ls="ls -Gh"

[ -f "${HOME}/.zshuser" ] && . "${HOME}/.zshuser"

