#!/bin/bash

echo $(pgrep -x "waybar")
if [[ $(pgrep -x "waybar") != "" ]];
then
killall waybar
fi
if [[ $(pgrep -x "waybar") = "" ]];
then
waybar > /dev/null 2>&1 &
fi
