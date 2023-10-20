#!/bin/bash

alert="\033[1;36m"
success="\033[1;32m"
warning="\033[1;33m"
error="\033[1;31m"
nocolour="\033[00m"
 
currenthostname=$(cat /etc/hostname)

if [[ $EUID -eq 0 ]];then

echo -e $alert Do you want to change your hostname? yes/no $nocolour
read ans 
 if [[ $ans == yes ]];then 
   echo -e $alert Enter the name you want to change your system hostname $nocolour
   read newname
   sudo hostnamectl set-hostname $newname
   sudo sed -i "s/$currenthostname/$newname/g" /etc/hosts
   sudo sed -i "s/$currenthostname/$newname/g" /etc/hostname
   echo -e  $warning new hostname of your system is  $nocolour
   sudo hostname
 else
  Exit
 fi
else 
 echo -e $warning Run in sudo privilege $nocolour
fi