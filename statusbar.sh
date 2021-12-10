#!/bin/bash

# Basic scrolling of truncated text
# Cannot get this to work with dwmblocks without using xsetroot (neither printf nor echo refresh, although it works in the terminal)


Main()
{
  MUSIC=$(cmus-remote -Q | grep 'status' | cut -d ' ' -f 2-)
  SENSORS=$(sensors | grep 'Package id 0:' | awk '{print substr($4,2)}')
  MEM=$(free -h | awk '/^Mem/ { print $7"/"$2 }' | sed s/i//g)
  DISK=$(df -h /dev/sda3 | awk '/dev/ { print $4 }')
  BATTERY=$(bash battery-stat.sh)
  DATE=$(date '+%b %d (%a) %R ')
  UPTIME=$(bash uptime.sh)
  while true;do

    if [ "$MUSIC" = "playing" ];
    then

      TITLE=$(cmus-remote -Q | grep 'file' | sed -e 's/file\s\/.\+\///g' -e 's/\..\+//g')
      if [ ${#TITLE} -gt "40" ];
      then

        y=10
        i=0
        while (( $i <= ( ${#TITLE}/4 ) ));
        do
          music_check=$(cmus-remote -Q | grep 'status' | cut -d ' ' -f 2-)
          if [ ! $music_check = "playing" ];
          then
            break
          else
          xsetroot -name "${TITLE:x:y}... | $UPTIME | $SENSORS | Mem: $MEM | $DISK | $BATTERY | $DATE"
            let y++
            let i++
            sleep 0.7
            tput cuu1
            tput el
          fi
        done

        Main
        #TITLE=$(echo $TITLE | cut -c1-30)...
        #echo "$TITLE"
      else

        xsetroot -name "${TITLE} | $UPTIME | $SENSORS | Mem: $MEM | $DISK | $BATTERY | $DATE"
        sleep 0.07
        tput cuu1
        tput el
        Main
      fi
    else
      xsetroot -name "$UPTIME | $SENSORS | Mem: $MEM | $DISK | $BATTERY | $DATE"
      Main
    fi
  done
}
Main
