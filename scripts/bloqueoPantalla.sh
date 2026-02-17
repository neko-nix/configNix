#!/usr/bin/env bash

LOCKFILE="/tmp/bloqueoPantalla.lock"

if [ -e "$LOCKFILE" ]; then
    #echo "$(date '+%F %T') → Ya estaba corriendo, salgo" >> /tmp/bloqueoPantalla.log
    exit 0
fi

touch "$LOCKFILE"
# asegurar que aunque el script muera, se borre el lock
trap "rm -f '$LOCKFILE'" EXIT

#echo "$(date '+%F %T') → Script arrancó. Mostrar Fondo Inicial" >> /tmp/bloqueoPantalla.log


~/configNix/scripts/mostrarFondo.sh

STATUS_FILE="$HOME/.cache/dunst_paused"
WAS_ALREADY_MUTED=false

if [[ -f "$STATUS_FILE" ]]; then
    WAS_ALREADY_MUTED=true
else
    dunstctl close-all
    dunstctl set-paused true
    touch "$STATUS_FILE"
fi

# Bloquear pantalla (esto pausa el script hasta que se desbloquee)
# Lanzar hyprlock en background
hyprlock

# Esperar hasta que hyprlock termine
while pgrep -x hyprlock >/dev/null; do
    sleep 0.5
done


~/configNix/scripts/mostrarFondo.sh
#echo "$(date '+%F %T') → Mostrar Fondo 2" >> /tmp/bloqueoPantalla.log

# Restaurar notificaciones solo si las muteamos nosotros
if [[ "$WAS_ALREADY_MUTED" == "false" ]]; then
    dunstctl set-paused false
    rm -f "$STATUS_FILE"
    notify-send "🔔 Notificaciones reactivadas"
fi


#echo "$(date '+%F %T') → Script terminó. Se borró lockfile" >> /tmp/bloqueoPantalla.log
