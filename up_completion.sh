#!/bin/bash
# up.sh: Quickly traverse up the current working path.
# Author: Shannon Moeller <me@shannonmoeller.com>
# Source to use: [ -f /path/to/up.sh ] && . /path/to/up.sh

_up_completion() {
	local p
  local w
  p="$(dirname $PWD)"
  w="${COMP_WORDS[COMP_CWORD]}"

	COMPREPLY=( $(IFS=';' compgen -S/ -W "${p//\//;}" -- "$w") )
}

# tab-completion
complete -o nospace -F _up_completion up
