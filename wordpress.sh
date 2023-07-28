#!/bin/bash
alert="\033[1;36m"
success="\033[1;32m"
warning="\033[1;33m"
error="\033[1;31m"
nocolour="\033[00m"

if [[ -f /home/aswathy/testing ]];then
  echo -e $alert file exist $nocolour
elif [[ ! -f /home/aswathy/testing ]];then 
  echo -e $alert Do you want to install wordpress ? $nocolour
  read ans
 if [[ $ans == yes ]]; then
  wget https://wordpress.org/latest.zip -O /home/aswathy/testing/latest.zip
  echo -e $success file downloaded successfully $nocolour
  sudo unzip -q -d /var/www/html/ latest.zip
  echo -e $alert Unzip successful $nocolour
  sudo chmod -R 750 /var/www/html/wordpress
  echo -e $alert permission granted successfully $nocolour
else
  exit
fi
fi
