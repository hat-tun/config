autoload -U compinit
compinit

### TotalTerminal ###
#open -a TotalTerminal

###permittion###
umask 022



###option###
setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars
setopt noclobber # deny redirection without new file
setopt list_packed 
setopt list_rows_first #display vartical direction
setopt numeric_glob_sort #sort by number
setopt list_types #equal with 'ls -F'  

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


###key bind###
bindkey -e



###history###
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt hist_ignore_dups		#ignore same command history
setopt share_history		#share command history data
setopt hist_ignore_space        #ignore the command which begins with space
setopt hist_reduce_blanks       #delete vain space
setopt hist_no_store            #don't register history command to history 
setopt inc_append_history       #register command just after that
setopt append_history           #incremental store
setopt extended_history         #write command time also


autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


###prompt###
autoload colors 
colors

	###git branch###
function git_branch(){
  local name st color

  if [[ "$PWD" = '/\.git(/.*)?$' ]]; then
	return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
  	return
  fi
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
	color=${fg[blue]}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
	color=${fg[green]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
	color=${fg_bold[red]}
  else
	color=${fg[red]}
  fi

  echo "%{$color%}$name%{$reset_color%} "
}

setopt prompt_subst

PROMPT="%{${fg[red]}%}[%n@%m]%# %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[blue]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"

#RPROMPT="%{${fg[red]}%}[%~]%{${reset_color}%}"
RPROMPT='%{${fg[red]}%}[`git_branch`%~%{${fg[red]}%}]%{${reset_color}%}'

###alias###
alias la='ls -a'
alias ll="ls -l"
alias lsa='ls -dl .*'

alias updatedb="sudo /usr/libexec/locate.updatedb"
alias ack='ack'

alias jbibtex="pbibtex"

###global alias###
alias -g M='|more'
alias -g G='|grep -i'
alias -g L='|less'

###env var###
export LANG=ja_JP.UTF-8
export MANPATH=/opt/local/man:$MANPATH
export CC=/usr/bin/gcc-4.2
export CFLAGS="-I/opt/local/include -O2"
export LDFLAGS="-L/opt/local/lib" 
#export LD_LIBRARY_PATH=/opt/local/lib:/usr/lib:/usr/X11R6/lib:$LD_LIBRARY_PATH
export PATH=$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/usr/texbin:/Users/hattun/Documents/android-sdk-mac_86/tools:/usr/local/share/python:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/Django-1.2-py2.7.egg:$PYTHONPATH
export SVN_EDITOR=vim

eval "$(rbenv init -)"

