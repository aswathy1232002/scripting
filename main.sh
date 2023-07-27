#!/bin/bash
alert="\033[1;36m"
success="\033[1;32m"
warning="\033[1;33m"
error="\033[1;31m"
nocolour="\033[00m"

if [[ -d /home/aswathy/testing ]];then
echo -e $warning file exist $nocolour
else 
mkdir -p /home/aswathy/testing
echo -e $success directory created $nocolour
fi
if [[ -f home/aswathy/testing/latest.zip ]];then
echo -e $alert file exist $nocolour
else 
wget https://wordpress.org/latest.zip -o /home/aswathy/testing/latest.zip
echo -e $success file dowloaded $nocolour
fi
