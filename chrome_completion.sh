#!/bin/bash

_chrome_completion() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local options="--help --app="

  if [[ "$cur" == -* ]] ; then
    COMPREPLY=( $(compgen -W "$options" -- $cur) )
  fi
}

complete -o default -o nospace -F _chrome_completion chrome
