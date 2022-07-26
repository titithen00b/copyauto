#!/bin/bash

#Set de la varibale J-1 avec affichage : YYYYMMJJ
j_1=`date -d "$(date +%Y-%m-%d) -3 day" +%Y%m%d`
echo "$j_1"

#Test J-1 pas samedi ni dimanche
J=`date -d "-1 day" +%A`
if [ $J == "Sunday" ] || [  $J == "Saturday" ] || [ $J == "dimanche" ] || [ $J == "samedi" ]
then echo "Aucune sauvegarde le samedi/dimanche" && param=0
else echo "Let's go !" && param=1
fi



for i in $(ls -l | grep "$j_1") 
do
if [ "$param" = "1" ]
then zip "$i" && cp "$i" /volumeUSB/usbshare/BACKUP/
else echo off
done
