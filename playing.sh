#!/bin/bash

# Basic scrolling of truncated text
# Cannot get this to work with dwmblocks without using xsetroot (neither printf nor echo refresh, although it works in the terminal)

MUSIC=$(cmus-remote -Q | grep 'status' | cut -d ' ' -f 2-)
Main()
{
  while true;do

    if [ "$MUSIC" = "playing" ];
    then

      TITLE=$(cmus-remote -Q | grep 'file' | sed -e 's/file\s\/.\+\///g' -e 's/\..\+//g')
      if [ ${#TITLE} -gt "30" ];
      then

        x=0
        y=8
        i=0
        while (( $i <= ( ${#TITLE}/3 ) ));
        do
          #echo ${STRING:x:y}
          xsetroot -name "${TITLE:x:y}..."
          let x++
          let y++
          let i++
          sleep 0.7
          tput cuu1
          tput el
        done
        Main
        #TITLE=$(echo $TITLE | cut -c1-30)...
        #echo "$TITLE"
      else

        xsetroot -name "$TITLE"
        sleep 0.07
        tput cuu1
        tput el
      fi
    else

      exit 0
    fi
  done
}
Main
