#!/bin/bash

_julia() {
  local options cur prev
  options="-- -C --check-bounds --code-coverage --color --compile --compilecache
	--cpu-target --depwarn -e -E --eval -h -H --handle-signals
	--help --history-file --home -i --inline -J -L --load --machinefile
	--math-mode -O --optimize --output-bc
	--output-incremental --output-ji --output-o -p
	--precompiled --print --procs -q --quiet --startup-file --sysimage
	--track-allocation -v --version"
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [[ "$cur" = -* ]] ; then
    COMPREPLY=( $(compgen -W "$options" -- "$cur") )
  else
		case "$prev" in
			'--precompiles' | '--compilecache' | '--startup-file' | '--handle-signals' | \
			'--color' | '--history-file' | '--inline' | '--check-bounds')
				COMPREPLY=( $(compgen -W 'yes no' -- "$cur") )
				;;
			'--compile')
				COMPREPLY=( $(compgen -W 'yes no all min' -- "$cur") )
				;;
			'-O' | '--optimize')
				COMPREPLY=( $(compgen -W '1 2 3 4' -- "$cur") )
				;;
			'--math-mode')
				COMPREPLY=( $(compgen -W 'ieee fast' -- "$cur") )
				;;
			'--deepwarn')
				COMPREPLY=( $(compgen -W 'yes no error' -- "$cur") )
				;;
			'--code-coverage' | '--track-allocation')
				COMPREPLY=( $(compgen -W 'none user all') )
				;;
			*)
				COMPREPLY=( $(compgen -f -- "$cur") )
		esac
  fi
}

complete -F _julia julia
