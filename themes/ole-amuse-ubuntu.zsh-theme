# vim:ft=zsh ts=2 sw=2 sts=2

eval morange='$FG[202]'
eval mgreen='$FG[102]'

rvm_current() {
  rvm current 2>/dev/null
}

#for color in {0..256}; do
#  eval ccc='$FG[$color]'
#  echo -en "$ccc $color $reset_color"
#done

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}
if (( `id -u` == 0 )); then
  PROMPT='u14 $morange%n$reset_color%} %{$mgreen%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) [%{$fg_bold[red]%}%*%{$reset_color%}]
$ '
else
  PROMPT='u14 $fg[green]%n %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) [%{$fg_bold[red]%}%*%{$reset_color%}]
$ '
fi


ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}⭠ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
