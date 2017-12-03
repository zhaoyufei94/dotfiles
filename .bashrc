export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\e[1;36m\]\u[\#] \[\e[0;90m\]@ \[\e[1;34m\]\w\[\e[0;33m\]\$(parse_git_branch)\[\e[1;35m\] ->> \[\e[00m\]"

extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1	;;
			*.tar.gz)	tar xzf $1	;;
			*.zip)		unzip $1	;;
			*.7z)		7z x $1		;;
			*.rar)		unrar e $1	;;
			*.tar)		tar xf $1	;;
			*.gz)		gunzip $1	;;
			*)	echo "'$1' cannot be extracted via extract()"	;;
		esac
	else
		echo "'$1' is invalid file"
	fi
}


