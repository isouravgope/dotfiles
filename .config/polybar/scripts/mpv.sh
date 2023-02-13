#!/bin/bash
_print_time() {
    printf ' %s %d:%02d:%02d' "$1" "$2" "$3" "$4"
}
if pidof mpv > /dev/null; then
    SOCK='/tmp/mpvsocket'
    metadata=$(echo '{ "command": ["get_property", "media-title"] }' | socat - $SOCK | jq -r .data)
    position=$(echo '{ "command": ["get_property_string", "time-pos"] }' | socat - $SOCK  | jq -r .data | cut -d'.' -f 1)
    remaining=$(echo '{ "command": ["get_property_string", "time-remaining"] }' | socat - $SOCK | jq -r .data | cut -d'.' -f 1)
    printf '%s' "$metadata"
    _print_time '|' $((position/3600)) $((position%3600/60)) $((position%60))
    _print_time '-' $((remaining/3600)) $((remaining%3600/60)) $((remaining%60))
else
    echo ""
fi

