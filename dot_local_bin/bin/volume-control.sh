#!/bin/bash

# Параметры
STEP=2  # Шаг изменения громкости
ICON_HIGH="audio-volume-high"
ICON_MEDIUM="audio-volume-medium"
ICON_LOW="audio-volume-low"
ICON_MUTED="audio-volume-muted"

# Получение текущей громкости
get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//'
}

# Проверка состояния mute
is_muted() {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"
}

# Изменение громкости
case "$1" in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +$STEP%
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -$STEP%
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
esac

# Отображение уведомления
if is_muted; then
    notify-send -a "volume" "Volume" "Muted" -i $ICON_MUTED -h int:value:0 -h string:x-canonical-private-synchronous:volume
else
    VOLUME=$(get_volume)
    if [ "$VOLUME" -gt 66 ]; then
        ICON=$ICON_HIGH
    elif [ "$VOLUME" -gt 33 ]; then
        ICON=$ICON_MEDIUM
    else
        ICON=$ICON_LOW
    fi
    notify-send -a "volume" "Volume" "$VOLUME%" -i $ICON -h int:value:$VOLUME -h string:x-canonical-private-synchronous:volume
fi
