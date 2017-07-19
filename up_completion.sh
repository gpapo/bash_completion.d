#!/bin/bash
# up.sh: Quickly traverse up the current working path.
# Author: Shannon Moeller <me@shannonmoeller.com>
# Source to use: [ -f /path/to/up.sh ] && . /path/to/up.sh

_up_completion() {
  local path="$(dirname $PWD)"
  local cur="${COMP_WORDS[COMP_CWORD]}"

	COMPREPLY=( $(IFS=';' compgen -S/ -W "${path//\//;}" -- "$cur") )
}

# tab-completion
complete -o nospace -F _up_completion up
