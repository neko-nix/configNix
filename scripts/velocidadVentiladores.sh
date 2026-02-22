#!/usr/bin/env bash


VELOCIDAD=$(sensors | grep "fan1:*" | awk 'NR==1 {print$2}')
#echo "$VELOCIDAD"
echo "{\"text\": \"$VELOCIDAD RPM 󰈐  \", \"tooltip\": \"Cebolla\"}"

