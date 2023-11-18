background="1ED760"
foreground="111111"

result="$(spt playback --status -f '%s %a - %t' 2>/dev/null)"
code="$?"

if [[ "$code" == "0" ]]; then
  icon="${result:0:1}"
  label="${result:1}"

  fg="#$foreground"
  bg="#$background"

  padding="  "

  before="%{B$bg}%{F$fg}$padding"
  after="$padding%{F-}%{B-}"
  before_title="%{F$bg}$padding"
  after_title="$padding%{F-}"

  title="$before_title Spotify $after_title"
  content="$before%{F$fg}%{T3}$icon%{T-}$label%{F-}$after"

  case "$icon" in
    "󰐊") status="playing"
    ;;
    "") status="paused"
    ;;
  esac

  echo "$title$content"
else
  fg="#$background"

  padding="  "
  before="%{B$bg}%{F$fg}$padding"
  after="$padding%{F-}%{B-}"

  title="%{F$fg} Spotify not playing %{F-}"
  echo "${before}$title${after}"
fi

exit $code
