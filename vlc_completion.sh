#!/bin/bash

_vlc() {
  local options cur prev
  options='-1 -2 --advanced --aspect-ratio --audio --audio-filter
  --audio-language --audio-replay-gain-default --audio-replay-gain-mode
  --audio-replay-gain-preamp --audio-time-stretch --audio-visual
  --auto-preparse --autoscale --bookmark --cd-audio --config
  --control --crop --custom-aspect-ratios --custom-crop-ratios
  --deinterlace --deinterlace-mode -down --dvd --extraintf
  --extrashort-jump-size -f --force-dolby-surround --full-help
  --fullscreen --global-key-aspect-ratio --global-key-audiodevice-cycle
  --global-key-audio-track --global-key-crop --global-key-decr-scalefactor
  --global-key-deinterlace --global-key-deinterlace-mode
  --global-key-faster --global-key-frame-next --global-key-incr-scalefactor
  --global-key-intf-show --global-key-jump --global-key-jump-extrashort
  --global-key-jump-long --global-key-jump-medium --global-key-jump-short
  --global-key-leave-fullscreen --global-key-loop --global-key-next
  --global-key-play-pause --global-key-prev --global-key-program-sid-next
  --global-key-program-sid-prev --global-key-quit --global-key-random
  --global-key-rate-faster-fine --global-key-rate-normal
  --global-key-rate-slower-fine --global-key-slower --global-key-stop
  --global-key-subtitle-toggle --global-key-subtitle-track
  --global-key-toggle-autoscale --global-key-toggle-fullscreen
  --global-key-vol-down --global-key-vol-mute --global-key-vol-up
  --global-key-wallpaper --global-key-zoom-double --global-key-zoom-half
  --global-key-zoom-original --global-key-zoom-quarter -h -H
  --help --help-verbose --hotkeys-mousewheel-mode -I --ignore-config
  --input-fast-seek --input-repeat --input-title-format --interact --intf
  --key-aspect-ratio --key-audiodevice-cycle --key-audio-track --key-crop
  --key-decr-scalefactor --key-deinterlace --key-deinterlace-mode
  --key-faster --key-frame-next --key-incr-scalefactor
  --key-intf-show --key-jump --key-jump-extrashort --key-jump-long
  --key-jump-medium --key-jump-short --key-leave-fullscreen --key-loop
  --key-next --key-play-pause --key-prev --key-program-sid-next
  --key-program-sid-prev --key-quit --key-random --key-rate-faster-fine
  --key-rate-normal --key-rate-slower-fine --key-slower --key-stop
  --key-subtitle-toggle --key-subtitle-track --key-toggle-autoscale
  --key-toggle-fullscreen --key-vol-down --key-vol-mute
  --key-vol-up --key-wallpaper --key-zoom-double --key-zoom-half
  --key-zoom-original --key-zoom-quarter -l -L -Left --list
  --list-verbose --longhelp --long-jump-size --loop --media-library
  --medium-jump-size --menu-language --metadata-network-access --module
  --mouse-hide-timeout --no-advanced --no-audio --no-audio-time-stretch
  --no-auto-preparse --no-autoscale --no-full-help --no-fullscreen
  --no-help --no-help-verbose --no-ignore-config --no-input-fast-seek
  --no-interact --no-list --no-list-verbose --no-longhelp --no-loop
  --no-media-library --no-metadata-network-access --no-osd --no-overlay
  --no-play-and-exit --no-play-and-stop --no-playlist-autostart
  --no-playlist-cork --no-playlist-tree --no-quiet --no-random
  --no-repeat --no-reset-config --no-reset-plugins-cache
  --no-snapshot-preview --no-snapshot-sequential --no-spdif
  --no-spu --no-sub-autodetect-file --no-version --no-video-on-top
  --no-video-title-show --no-video-wallpaper --open --osd --overlay -p
  -pictures --pidfile --play-and-exit --play-and-stop --playlist-autostart
  --playlist-cork --playlist-tree --preferred-resolution -q --quiet
  -R --random --rate --repeat --reset-config --reset-plugins-cache
  -Right --scale --short-jump-size --snapshot-format --snapshot-path
  --snapshot-prefix --snapshot-preview --snapshot-sequential --spdif --spu
  --stream-filter -styles --sub-autodetect-file --sub-file --sub-filter
  --sub-language --sub-source -[title -v --vcd --verbose --version
  --video-filter --video-on-top --video-splitter --video-title-position
  --video-title-show --video-title-timeout --video-wallpaper -Z'
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [[ "$prev" = -* ]] ; then
    case "$prev" in
      --force-dolby-surround )
        COMPREPLY=( $(compgen -W '1 2 3' -- $cur) )
        ;;
      --audio-replay-gain-mode )
        COMPREPLY=( $(compgen -W 'none track album' -- $cur) )
        ;;
      --audio-replay-gain-preamp | --audio-replay-gain-default)
        ;;
      --video-title-timeout | --mouse-hide-timeout)
        ;;
      --video-title-position)
        COMPREPLY=( $(compgen -W '0 1 2 4 8 5 6 9 10' -- $cur) )
        ;;
      --snapshot-path | --snapshot-prefix)
        ;;
      --snapshot-format)
        COMPREPLY=( $(compgen -W 'png jpg tiff') )
        ;;
      --crop | --custom-crop-ratios | --aspect-ratio)
        ;;
      --scale | --custom-aspect-ratios)
        ;;
      --deinterlace)
        COMPREPLY=( $(compgen -W '-1 0 1' -- $cur) )
        ;;
      --deinterlace-mode)
        COMPREPLY=( $(compgen -W 'discard blend mean bob linear x yadif yadif2x phosphor ivtc' -- $cur) )
        ;;
      --video-filter | --video-splitter)
        ;;
      --preferred-resolution)
        COMPREPLY=( $(compgen -W '-1 1080 720 576 360 240' -- $cur) )
        ;;
      --input-repeat | --rate)
        ;;
      -v | --verbose)
        ;;
      --hotkeys-mousewheel-mode)
        COMPREPLY=( $(compgen -W '0 1 2' -- $cur) )
    esac
  elif [[ "$cur" = -* ]] ; then
    COMPREPLY=( $(compgen -W "$options" -- $cur) )
  else
    COMPREPLY=( $(compgen -f -- $cur) )
  fi
}

complete -F _vlc vlc
