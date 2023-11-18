datadir="$HOME/.data/spotify"

function get_status {
  status_path="$datadir/status"
  if [[ ! -f "$status_path" ]]; then
    echo "stopped"
    return
  fi

  status="$(cat $status_path)"
  if [[ "$status" == "" ]]; then
    echo "stopped"
    return
  fi

  echo "$status"
}

function has_metadata {
  metadata_path="$datadir/status"
  if [[ ! -f "$metadata_path" ]]; then
    return 1
  fi

  player_metadata="$(cat $metadata_path)"
  if [ ["$player_metadata" == ""] ]; then
    return 1
  fi
}

function get_metadata {
  key="$1"
  metadata_path="$datadir/metadata"

  if [[ ! -f "$metadata_path" ]]; then
    return
  fi

  player_metadata="$(cat $metadata_path)"
  if [ ["$player_metadata" == ""] ]; then
    return
  fi

  while read -r first second third || [[ -n $first ]]; do
    if [[ $second == "$key" ]]; then
      echo "$third"
      return
    fi
  done <<< "$player_metadata"
}

function print_title {
  local color="#1ED760"
  local padding="  "
  local font="5"

  local before="%{F$color}%{T$font}$padding"
  local after="$padding%{T-}%{F-}"

  echo "${before}Spotify${after}"  
}

function print_track() {
  local background="#1ED760"
  local color="#111111"
  local padding="  "
  local font="6"

  case "$(get_status)" in
    "playing") ;;
    "paused")
      local background="#116E3C"
    ;;
    "stopped")
      exit
    ;;
  esac

  local before="%{B$background}%{F$color}%{T$font}$padding"
  local after="$padding%{T-}%{F-}%{B-}"

  local artist="$(get_metadata 'xesam:artist')"
  local track="$(get_metadata 'xesam:title')"
  local label="$artist - $track"

  if [[ "$label" == " - " ]]; then
    echo "${before}Loading...${after}"
  else
    echo "${before}$label${after}"
  fi
}

echo "$(print_title)$(print_track)"
