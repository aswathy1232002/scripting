#!/bin/bash

alert="\033[1;36m"
success="\033[1;32m"
warning="\033[1;33m"
error="\033[1;31m"
nocolour="\033[00m"

if [[ $EUID -eq 0 ]];then
    if [[ -f /var/userlist ]];then
    echo -e $error File Exists $nocolour
    else
    touch /var/userlist
    vim useradd.txt
    username=$( cat useradd.txt | tr 'A-Z' 'a-z' )
    for users in $username
        do
        useradd -m $users
        passwd=$(cat /dev/urandom | tr -dc '[:alnum:][:punct:]' | fold -w 12 | head -n 1)
        echo " $users - $passwd " >> /var/userlist
        done
    fi
else
echo -e $warning Run in sudo mode $nocolour
fi


         
    