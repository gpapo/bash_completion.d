#!/bin/bash
# apt-history completion
_apt_history_completion() {
  local options="-h -V -i --install -u --upgrade -r --remove -R --rollback -g --grep"
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$options" -- $cur) )
}

complete -o nospace -F _apt_history_completion apt-history
# end apt-history completion
