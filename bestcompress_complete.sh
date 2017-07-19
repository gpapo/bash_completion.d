#!/bin/bash

_bestcompress_complete() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local opts="-h -V -a -k"

  if [[ "$cur" == -* ]] ; then
    COMPREPLY=( $(compgen -W "$opts" -- $cur) )
  fi
}

complete -o default -F _bestcompress_complete bestcompress
