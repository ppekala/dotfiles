
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '^[[3~' delete-char

zstyle :compinstall filename '/home/corn/.zshrc'

autoload -U colors && colors
autoload -Uz compinit && compinit

setopt autocd
setopt nobeep

PS1="%{${fg[green]}%}%B[%m@%3~]%#%b "

export BLOCKSIZE="K"
export EDITOR="vim"
export H="${HOME}"
export LSCOLORS="Exfxcxdxbxegedabagacad"
which most >/dev/null && export MANPAGER="most"
if which less >/dev/null; then
	export PAGER="less"
	export LESS="-R --clear-screen --quit-if-one-screen --ignore-case --SILENT --chop-long-lines --tabs=3"
fi
which ydiff >/dev/null && export PAGER_DIFF="ydiff"

osname=$(uname -s)
if [ "$osname" = "FreeBSD" ]; then
	PORTSDIR="/usr/ports"
	[ -d "${PORTSDIR}" ] || PORTSDIR=$(make -V PORTSDIR)
	[ -d "${PORTSDIR}" ] && export PORTSDIR || unset PORTSDIR

	PATH="${PATH}:${PORTSDIR}/Tools/scripts"
	if [ $UID -ne 0 -a -n "$(id | grep wheel)" ]; then
		PATH="${PATH}:/sbin:/usr/sbin:/usr/local/sbin"
		alias spkg="sudo pkg"
	fi

	alias ll="ls -Glh"
	alias ls="ls -Gh"
	alias top="top -PI"
fi

if [ "$osname" = "Linux" ]; then
	alias ll="ls -lh --color"
	alias ls="ls -h --color"
fi

[ -d "${HOME}/bin" ] && PATH="${PATH}:${HOME}/bin"
export PATH
[ -d "${HOME}/tmp" ] || mkdir ${HOME}/tmp

alias del="rm -i"
which dfc >/dev/null && alias df="dfc" || alias df="df -h"
alias du="du -h"

if [ -n "${PAGER_DIFF}" ]; then
	alias sdc="svn diff | ${PAGER_DIFF}"
else
	alias sdc="svn diff | ${PAGER}"
fi

[ -f "${HOME}/.zshuser" ] && . "${HOME}/.zshuser"

