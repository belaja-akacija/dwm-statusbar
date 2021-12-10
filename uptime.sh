#!/bin/bash
UPTIME=$(uptime | column -t --separator=":,")

HOURS=`echo $UPTIME | awk '{print $5}'`
MINUTES=`echo $UPTIME | awk '{print $6}'`
SECS=`echo $UPTIME | awk '{print $3}'`

echo "Up:" $HOURS":"$MINUTES":"$SECS
