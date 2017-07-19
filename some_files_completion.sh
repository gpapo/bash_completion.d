#!/bin/bash

_some_files_completion() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local options="-h -V -o -p -e -d -n \
  --help --version --outfolder --prefix --ext --dim --num"

  if [[ "$cur" == -* ]] ; then
    COMPREPLY=( $(compgen -W "$options" -- $cur) )
  fi
}

complete -F _some_files_completion some-files
