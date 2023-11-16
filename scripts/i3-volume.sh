# Usage: i3-volume.sh <up|down|mute> [volume_step=1]

volume_max=100

# Uses regex to get volume from pactl
function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

function print_usage {
  echo "usage: "
  echo "  i3-volume.sh <up> [volume_step=1]"
  echo "  i3-volume.sh <down> [volume_step=1]"
  echo "  i3-volume.sh <mute>"
}

function get_volume_step {
  local volume_step_default=1
  local volume_step="$1"

  if [[ "$volume_step" == "" ]]; then
    echo "$volume_step_default"
    exit 0
  fi

  # Validate volume_step
  if ! [[ "$volume_step" =~ ^[0-9]+$ ]]; then
    echo "error: volume_step must be a number, got $volume_step" >&2
    print_usage >&2
    echo "$volume_step_default"
    exit 1
  fi

  echo "$volume_step"
}

volume=$(get_volume)
volume_step=$(get_volume_step $2)

case $1 in
    up)
    # Unmutes and increases volume, then displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ 0

    if [ $(( "$volume" + "$volume_step" )) -gt $volume_max ]; then
        pactl set-sink-volume @DEFAULT_SINK@ $volume_max%
    else
        pactl set-sink-volume @DEFAULT_SINK@ +$volume_step%
    fi
    ;;

    down)
    # Raises volume and displays the notification
    pactl set-sink-volume @DEFAULT_SINK@ -$volume_step%
    ;;

    mute)
    # Toggles mute and displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;

    *)
    # Print usage
    print_usage
    ;;
esac
