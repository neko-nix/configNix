#!/usr/bin/env bash

chosen=$(printf "🔕 Toggle Notificaciones\n🎞️ Elegir fondo animado\n🔄 Recarga de aplicaciones\n" | rofi -dmenu -i -p "Acciones")
case "$chosen" in

  "🔕 Toggle Notificaciones")
    ~/configNix/scripts/pausarNotificaciones.sh
    ;;

  "🎞️ Elegir fondo animado")
    ~/configNix/scripts/fondoAnimado.sh
    ;;

  "🔄 Recarga de aplicaciones")
    ~/configNix/scripts/refresco.sh
    ;;


    
esac


}