#!/bin/bash

_ansi_completion() {
  local options="
  --insert-chars --ich --erase-display --ed --erase-line --el --insert-lines --il\
  --delete-lines --dl --delete-chars --dc --scroll-up --su --scroll-down --sd\
  --erase-chars --ec --repeat --rep\
  --up --cuu --down --cud --forward --cuf --backward --cub --next-line --cnl\
  --prev-line --cpl --column --cha --position --cup --tab-forward --tab-backward\
  --column-relative --hpr --line --vpa --line-relative --vpr --save-cursor\
  --restore-cursor --hide-cursor --show-cursor\
  --bold --faint --italic --underline --blink --inverse --invisible --strike\
  --fraktur --double-underline --frame --encircle --overline\
  --black --red --green --yellow --blue --magenta --cyan --white\
  --black-intense --red-intense --green-intense --yellow-intense\
  --blue-intense --magenta-intense --cyan-intense --white-intense\
  --bg-black --bg-red --bg-green --bg-yellow --bg-blue --bg-magenta --bg-cyan\
  --bg-white --bg-black-intense --bg-red-intense --bg-green-intense\
  --bg-yellow-intense --bg-blue-intense --bg-magenta-intense --bg-cyan-intense\
  --bg-white-intense\
  --reset-attrib --reset-foreground --reset-background --reset-color\
  --report-position --report-window-state --report-window-position\
  --report-window-pixels --report-window-chars --report-screen-chars\
  --report-icon --report-title\
  --color-table --icon --title --no-restore -n --newline --escape --bell\
  --reset
"
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$options" -- $cur) )
}

complete -F _ansi_completion ansi
