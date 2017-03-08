#!/bin/bash

music_info() {
  artist=`/home/chouffe/.xmonad/scripts/shpotify current | grep "^Artist" | tr " \t" "\n" | tail -n +2 | grep -Ev "^$" | tr "\n" " " | awk '{$1=$1;print}'`

  track=`/home/chouffe/.xmonad/scripts/shpotify current | grep "^Title" | tr " \t" "\n" | tail -n +2 | grep -Ev "^$" | tr "\n" " " | awk '{$1=$1;print}'`

  # Take only 40 first characters
  echo "$artist: $track" | head -c35
}

music_info
