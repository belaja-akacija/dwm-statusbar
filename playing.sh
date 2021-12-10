#!/bin/bash

MUSIC=$(cmus-remote -Q | grep 'status' | cut -d ' ' -f 2-)

if [ "$MUSIC" = "playing" ];
then
  TITLE=$(cmus-remote -Q | grep 'file' | sed -e 's/file\s\/.\+\///g' -e 's/\..\+//g')
  if [ ${#TITLE} -gt "30" ];
  then
    TITLE=$(echo $TITLE | cut -c1-30)...
    echo "$TITLE"
else
  echo "$TITLE"
  fi
else
  exit 0
fi
