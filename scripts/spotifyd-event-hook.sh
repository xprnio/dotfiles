#!/bin/bash

state="$PLAYER_EVENT"

datadir="$HOME/.data/spotify"
data_log="$datadir/event-log"
data_status="$datadir/status"
data_metadata="$datadir/metadata"

function has_metadata {
  if [[ ! -f "$data_metadata" ]]; then
    return 1
  fi

  player_metadata="$(cat $data_metadata)"
  if [ ["$player_metadata" == ""] ]; then
    return 1
  fi
}

function update_metadata {
  contents="$(playerctl metadata)"
  echo "$contents" > $data_metadata
}

case "$state" in
  "change")
    echo "player status: change" >> $data_log
    update_metadata
  ;;
  "play")
    echo "player status: play" >> $data_log
    echo "playing" > $data_status
    has_metadata || update_metadata
  ;;
  "pause")
    echo "player status: pause" >> $data_log
    echo "paused" > $data_status
    has_metadata || update_metadata
  ;;
  "stop")
    echo "player status: stop" >> ~/data/spotify/status
    echo "stopped" > $data_status
    echo "" > $data_metadata
  ;;
  *)
    echo "event $state" >> $data_log
  ;;
esac
