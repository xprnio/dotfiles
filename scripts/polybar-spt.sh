background="1ED760"
foreground="111111"

result="$(spt playback --status -f '%s %a - %t' 2>/dev/null)"
code="$?"

if [[ "$code" == "0" ]]; then
  icon="${result:0:1}"
  label="${result:2}"

  fg="#$foreground"
  bg="#$background"

  padding="  "

  before_title="%{F$bg}$padding"
  after_title="$padding%{F-}"
  case "$icon" in
    "󰐊")
      # icon=""
      icon=""
    ;;
    "")
      # icon="󰐊"
      icon="PAUSED$padding"
      bg="#1EA345"
    ;;
  esac

  before="%{B$bg}%{F$fg}$padding"
  after="$padding%{F-}%{B-}"

  title="$before_title Spotify $after_title"
  content="$before%{F$fg}%{T4}$icon%{T-}$label%{F-}$after"
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
