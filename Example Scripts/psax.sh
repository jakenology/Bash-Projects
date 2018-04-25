#!/bin/sh
SERVICE='Terminal'
 
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is fine"
else
    echo "$SERVICE is not running"
    echo "$SERVICE is not running!" | mail -s "$SERVICE down" root
fi