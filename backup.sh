#!/bin/bash

alert="\033[1;36m"
success="\033[1;32m"
warning="\033[1;33m"
error="\033[1;31m"
nocolour="\033[00m"

backup_file="/var/backups/aswathy-$(date +\%d-\%m-\%Y).tar.gz"

sudo tar -zcpf "$backup_file" /home/aswathy

if [[ ! -f "$backup_file" ]]; then
    
    echo "Backup of /home/aswathy failed on $(date +\%d-\%m-\%Y)" | sudo mail -s "Backup Failed" root
else
      
 echo "Backup of /home/aswathy Success on $(date +\%d-\%m-\%Y) " | sudo mail -s "Backup Success" root

    # echo "$message" | write root

fi
