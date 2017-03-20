fast_git_ps1 (){
  printf -- "$(git branch 2>/dev/null | grep -e '\*' | sed 's/^..\(.*\)/\(\1\)/')"
}
local ret_status="win %(?:%{$fg_bold[green]%}> :%{$fg_bold[red]> %s)"

PROMPT='${ret_status}%{$fg_bold[white]%}%p%c %{$fg[red]%}$(fast_git_ps1)%{$reset_color%} %* $ %{$reset_color%}'

