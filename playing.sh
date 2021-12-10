#!/bin/bash
#TMP=$(mocp --info > /tmp/music_state)
#MUSIC=$(grep "State" /tmp/music_state | sed 's/State\:\s//g')

#if [[ $MUSIC =~ PLAY ]];
#then
  #NOW_PLAYING=$(grep File /tmp/music_state | sed -e 's/File:\s\(\/.\+\/\)\+//g' -e 's/\..\+//g')
  #echo "$NOW_PLAYING"
#else
  #echo ""
#fi

MUSIC=$(cmus-remote -Q | grep 'status' | cut -d ' ' -f 2-)

if [ "$MUSIC" = "playing" ];
then
  TITLE=$(cmus-remote -Q | grep 'file' | sed -e 's/file\s\/.\+\///g' -e 's/\..\+//g')
  #LENGTH=${#TITLE}
  #TRUNC=$(echo $TITLE | cut -c1-30)
  #echo $LENGTH
  if [ ${#TITLE} -gt "30" ];
  then
    TITLE=$(echo $TITLE | cut -c1-30)...
    echo "$TITLE"
else
  echo "$TITLE"
  fi
else
  exit 0
  #ARTIST=$(cmus-remote -Q | grep -e '[^m]artist' | cut -d ' ' -f 3-)
fi



#if [ "$MUSIC" = "PLAY" ];
#then
#xsetroot -name " $NOW_PLAYING "
#fi
