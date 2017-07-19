#!/bin/bash

_detox() {
  local options='-f -h --help -L -n --dry-run -r -s --special -v -V'
  local cur=${COMP_WORDS[COMP_CWORD]}

  if [[ "$cur" = -* ]] ; then
    COMPREPLY=( $(compgen -W "$options" -- $cur) )
  fi
}

complete -o default -F _detox detox
