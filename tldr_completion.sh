#!/usr/bin/env bash

_tldr() {
  # Options
  local options="-h --help -V --version -l --list -a --list-all -1 --single-column \
  -r --random -e --random-example -f --render -m --markdown -o --os --linux \
  --osx --sunos -t --theme -u --update -c --clear-cache"

  # Commands
  local commands="$(tldr --list-all | tr ', ' '\n')"

  # Current typing word
  local cur=${COMP_WORDS[COMP_CWORD]}
  # Previous typed word
  local prev=${COMP_WORDS[COMP_CWORD-1]}

  if [[ "$prev" = -f || "$prev" = --render ]] ; then
    COMPREPLY=( $(compgen -G *.md -- $cur) )
  elif [[ "$prev" = -o || "$prev" = --os ]] ; then
    COMPREPLY=( $(compgen -W "linux osx sunos" -- $cur) )
  elif [[ "$cur" = -* ]] ; then
    COMPREPLY=( $(compgen -W "$options" -- $cur) )
  else
    COMPREPLY=( $(compgen -W "$commands" -- $cur) )
  fi
}

complete -F _tldr tldr
