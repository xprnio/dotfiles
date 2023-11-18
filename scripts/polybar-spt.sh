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

  before_title="%{F$bg}%{T5}$padding"
  after_title="$padding%{T-}%{F-}"
  case "$icon" in
    "󰐊")
      # icon=""
      icon=""
    ;;
    "")
      # icon="󰐊"
      icon=""
      bg="#116E3C"
    ;;
  esac

  before="%{B$bg}%{F$fg}$padding"
  after="$padding%{F-}%{B-}"

  title="$before_title Spotify $after_title"
  content="$before%{F$fg}%{T4}$icon%{T-}%{T6}$label%{T-}%{F-}$after"
  echo "$title$content"
else
  fg="#$background"

  padding="  "
  before="%{B$bg}%{F$fg}$padding"
  after="$padding%{F-}%{B-}"

  title="%{T5} Spotify not playing %{T-}"
  echo "${before}$title${after}"
fi

exit $code
