
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '^[[3~' delete-char

zstyle :compinstall filename '/home/corn/.zshrc'

autoload -U colors && colors
autoload -Uz compinit && compinit

setopt autocd
setopt nobeep

PS1="%{${fg[green]}%}%B[%m@%~]%#%b "

export BLOCKSIZE="K"
export EDITOR="vim"
export FREEBSD_LOGIN="pawel"
export H="${HOME}"
export LESS="-R --clear-screen --quit-if-one-screen --ignore-case --SILENT --chop-long-lines --tabs=3"
export LSCOLORS="Exfxcxdxbxegedabagacad"
which most >/dev/null && export MANPAGER="most"
export PAGER="less"
which cdiff >/dev/null && export PAGER_DIFF="cdiff"
export PSVN="svnlite"

readonly PORTSDIR="$(make -V PORTSDIR /usr/share/mk/bsd.ports.mk 2>/dev/null)"

PATH="${PATH}:${PORTSDIR}/Tools/scripts"
if [ $UID -ne 0 -a -n "$(id | grep wheel)" ]; then
	PATH="${PATH}:/sbin:/usr/sbin:/usr/local/sbin"
	alias spkg="sudo pkg"
fi
[ -d "${HOME}/bin" ] && PATH="${PATH}:${HOME}/bin"
export PATH
[ -d "${HOME}/tmp" ] || mkdir ${HOME}/tmp

alias del="rm -i"
which dfc >/dev/null && alias df="dfc" || alias df="df -h"
alias du="du -h"
alias ll="ls -Glh"
alias ls="ls -Gh"
alias top="top -PI"

if [ -n "${PAGER_DIFF}" ]; then
	alias sdc="svn diff | ${PAGER_DIFF}"
else
	alias sdc="svn diff | ${PAGER}"
fi

[ -f "${HOME}/.zshuser" ] && . "${HOME}/.zshuser"

