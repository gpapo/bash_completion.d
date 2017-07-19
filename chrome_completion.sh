#!/bin/bash

_chrome_completion() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local options="--help --app="

  if [[ "$cur" == -* ]] ; then
    COMPREPLY=( $(compgen -W "$options" -- $cur) )
  fi
}

# chrome is an alias for google-chrome
# complete ... google-chrome seems not to work
complete -o default -o nospace -F _chrome_completion chrome
