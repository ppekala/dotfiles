
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
export CVS_OPTIONS="-z 6 -q"
export CVS_RSH="ssh"
export EDITOR="vim"
export FREEBSD_LOGIN="pawel"
export H="${HOME}"
export LESS="-R --clear-screen --quit-if-one-screen --ignore-case --SILENT --chop-long-lines --tabs=3"
export LSCOLORS="Exfxcxdxbxegedabagacad"
which most >/dev/null && export MANPAGER="most"
export PAGER="less"
which cdiff >/dev/null  && export PAGER_DIFF="cdiff"
export PMK="/usr/ports/Mk"
export PSVN="svnlite"
export TOP="-PI"

PATH="${PATH}:${PORTSDIR:-/usr/ports}/Tools/scripts"
if [ $UID -ne 0 -a -n "$(id | grep wheel)" ]; then
	PATH="${PATH}:/sbin:/usr/sbin:/usr/local/sbin"
	alias spkg="sudo pkg"
fi
[ -d "${HOME}/bin" ] && PATH="${PATH}:${HOME}/bin"
export PATH

alias del="rm -i"
which dfc >/dev/null && alias df="dfc" || alias df="df -h"
alias du="du -h"
alias ll="ls -Glh"
alias ls="ls -Gh"

if [ -n "${PAGER_DIFF}" ]; then
	alias sdc="svn diff | ${PAGER_DIFF}"
else
	alias sdc="svn diff | ${PAGER}"
fi

[ -f "${HOME}/.zshuser" ] && . "${HOME}/.zshuser"

