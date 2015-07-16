# vim:ft=zsh ts=2 sw=2 sts=2

eval morange='$FG[202]' 
eval cpath='$FG[102]'

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

_goenv() {
    [ -n "${GOENV}" ] && echo "(golang-${GOENV}) " && return
}

if (( `id -u` == 0 )); then
  PROMPT='$morange%n$reset_color%} %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) [%{$fg_bold[red]%}%*%{$reset_color%}]
$ '
else
#  PROMPT='$(_goenv)$fg[green]%n %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) [%{$fg_bold[red]%}%*%{$reset_color%}]
#$ '
  PROMPT='$(_goenv)$fg[green]%n %{$cpath%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) [%{$fg_bold[red]%}%*%{$reset_color%}]
$ '
fi


ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}⭠ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
