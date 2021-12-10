#!/bin/bash

STATE=$(acpi | grep 'Battery 0' | sed 's/Battery\s0:\s\(\w\+\).\+/\1/g')
PERCENTAGE=$(acpi | grep 'Battery 0' | sed 's/Battery\s0:\s\w\+,\s\([0-9]\+%\).\+/\1/g')
declare -a ICONS=("▲" "▼" "▇")

if [ $STATE = Charging ];
then
  echo "${ICONS[0]} $PERCENTAGE"
elif [ $STATE = Discharging ];
then
  echo "${ICONS[1]} $PERCENTAGE"
elif [ $STATE = Full ];
then
  echo "${ICONS[2]}"
fi
