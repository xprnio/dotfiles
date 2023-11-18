background="1ED760"
foreground="111111"

result="$(spt playback --status -f '%s %a - %t' 2>/dev/null)"
code="$?"
if [[ "$code" == "0" ]]; then
  icon="${result:0:1}"
  label="${result:1}"

  fg="#$foreground"
  bg="#$background"
  fg_muted="#66000000"

  padding="  "
  before="%{B$bg}%{F$fg}$padding"
  after="$padding%{F-}%{B-}"

  title="%{F$fg_muted}Spotify %{F-}"
  content="%{F$fg}%{T3}$icon%{T-}$label%{F-}"

  case "$icon" in
    "󰐊") status="playing"
    ;;
    "") status="paused"
    ;;
  esac

  echo "${before}$title $content${after}"
else
  fg="#$background"

  padding="  "
  before="%{B$bg}%{F$fg}$padding"
  after="$padding%{F-}%{B-}"

  title="%{F$fg}Spotify not playing%{F-}"
  echo "${before}$title${after}"
  exit 1
fi
