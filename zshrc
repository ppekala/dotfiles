
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '^[[3~' delete-char

zstyle :compinstall filename "$HOME/.zshrc"

autoload -U colors && colors
autoload -Uz compinit && compinit

setopt autocd
setopt nobeep

PS1="%{${fg[green]}%}%B[%m@%3~]%#%b "

export BLOCKSIZE="K"
export EDITOR="vim"
export H="${HOME}"
export LSCOLORS="Dxfxcxdxbxegedabagacad"
which most >/dev/null && export MANPAGER="most"
if which less >/dev/null; then
	export PAGER="less"
	export LESS="-R --clear-screen --quit-if-one-screen --ignore-case --SILENT --chop-long-lines --tabs=3"
fi
which ydiff >/dev/null && export PAGER_DIFF="ydiff"

EXA="exa --long --header --git --group-directories-first --grid"

osname=$(uname -s)
if [ "$osname" = "FreeBSD" ]; then
	PATH="${PATH}:${PORTSDIR}/Tools/scripts"
	if [ $UID -ne 0 -a -n "$(id | grep wheel)" ]; then
		PATH="${PATH}:/sbin:/usr/sbin:/usr/local/sbin"
		alias pkg="sudo pkg"
	fi

	PORTSDIR="/usr/ports"
	[ -d "${PORTSDIR}" ] || PORTSDIR=$(make -V PORTSDIR)
	[ -d "${PORTSDIR}" ] && export PORTSDIR || unset PORTSDIR

	which exa >/dev/null && alias ll=$EXA || alias ll="ls -Glh"
	alias ls="ls -Gh"
	alias top="top -PI"
fi

if [ "$osname" = "Linux" ]; then
	if [ -f "/etc/debian_version" ]; then
		apt() {
			[ $UID -ne 0 ] && SUDO="sudo" || SUDO=""
			case $1 in
				changelog|download|list|policy|rdepends|search|show|showsrc|source)
					/usr/bin/apt $* ;;
				*)
					$SUDO /usr/bin/apt $* ;;
			esac
			unset SUDO
		}
	fi
	which exa >/dev/null && alias ll=$EXA || alias ll="ls -lh --color"
	alias ls="ls -h --color"

	cpus=$(cat /proc/cpuinfo | grep processor | wc -l)
	alias make="make -j$cpus"
fi

[ -d "${HOME}/bin" ] && PATH="${PATH}:${HOME}/bin"
export PATH
[ -d "${HOME}/tmp" ] || mkdir ${HOME}/tmp

alias del="rm -i"
which dfc >/dev/null && alias df="dfc" || alias df="df -h"
alias du="du -h"

unset EXA

[ -f "${HOME}/.zshuser" ] && . "${HOME}/.zshuser"

