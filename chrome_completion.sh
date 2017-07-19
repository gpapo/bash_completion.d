#!/bin/bash

_chrome_completion() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local options="--user-data-dir --app --incognito --proxy-server --no-proxy-server\
  --proxy-autodetect --proxy-pac-url --password-store --version"

  if [[ "$cur" == -* ]] ; then
    COMPREPLY=( $(compgen -W "$options" -- $cur) )
  fi
}

complete -o default -o nospace -F _chrome_completion google-chrome
