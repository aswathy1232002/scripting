#!/bin/bash

alert="\033[1;36m"
success="\033[1;32m"
warning="\033[1;33m"
error="\033[1;31m"
nocolour="\033[00m"

if [[ $EUID -eq 0 ]];then

 if [[ -f /var/userlist ]];then
   echo -e $alert File Exist $nocolour
    else 
     touch /var/userlist
     vim adduser.txt
     users=$(cat adduser.txt | tr 'A-Z' 'a-z' )
        declare -A user_passwords
     for user in $users
        do
         useradd -m $user
        password=$(openssl rand -base64 12)
             user_passwords["$user"]=$password
      echo "$user:$password" | chpasswd  
         echo "$user:$password" >> /var/userlist 
    done
      fi
else
  echo -e "${error}You must run this script as root.${nocolour}"
  exit 1
fi



      


