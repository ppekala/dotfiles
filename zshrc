
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

case $OSTYPE in
freebsd*)
	[ $UID -ne 0 ] && PATH="${PATH}:/sbin:/usr/sbin:/usr/local/sbin"

	PORTSDIR="/usr/ports"
	[ -d "${PORTSDIR}" ] || PORTSDIR=$(make -V PORTSDIR)
	if [ -d "${PORTSDIR}" ]; then
		export PORTSDIR
		PATH="${PATH}:${PORTSDIR}/Tools/scripts"
	else
		unset PORTSDIR
	fi

	pkg() {
		[ $UID -ne 0 ] && SUDO="sudo"
		case $1 in
			add|autoremove|check|clean|delete|fetch|lock|install|register|remove| \
			set|update|unlock|upgrade)
				$SUDO /usr/sbin/pkg $* ;;
			*)
				/usr/sbin/pkg $* ;;
		esac
	}

	which exa >/dev/null && alias ll=$EXA || alias ll="ls -Glh"
	alias gmake="gmake -j$(nproc)"
	alias ls="ls -Gh"
	alias top="top -PI"
	;;

linux*)
	if [ "$VENDOR" = "debian" -o "$VENDOR" = "ubuntu" ]; then
		apt() {
			[ $UID -ne 0 ] && SUDO="sudo"
			case $1 in
				autoclean|autoremove|build-dep|dist-upgrade|edit-sources| \
				full-upgrade|install|purge|reinstall|remove|update|upgrade)
					$SUDO /usr/bin/apt $* ;;
				*)
					/usr/bin/apt $* ;;
			esac
		}
	fi

	which exa >/dev/null && alias ll=$EXA || alias ll="ls -lh --color"
	alias ls="ls -h --color"
	alias make="make -j$(nproc)"
	;;

*)
	echo "Unsupported platform: $OSTYPE-$VENDOR" ;;
esac

[ -d "${HOME}/bin" ] && PATH="${PATH}:${HOME}/bin"
export PATH
[ -d "${HOME}/tmp" ] || mkdir ${HOME}/tmp

alias del="rm -i"
which dfc >/dev/null && alias df="dfc" || alias df="df -h"
alias du="du -h"

unset EXA

[ -f "${HOME}/.zshuser" ] && . "${HOME}/.zshuser"

