#!/bin/bash

warning="\033[1;33m"
purple="\033[0;35m"
nocolour="\033[00m"
cyan="\033[0;36m"

os=$(uname -o)
hostname=$(hostname)
ip=$(ifconfig | awk '/inet .*broadcast/{print $2}')
public_ip=$(curl -s icanhazip.com)
ram=$(free -h | awk '/Mem:/ {print $2}')
storage=$(df -h | awk '/\/$/ {print $2}')
used=$(df -h | awk '/\/$/ {print $3}')
available=$(df -h | awk '/\/$/ {print $4}')

echo ----------------------------------------
echo -e "$warning SYSTEM RESOURCES $nocolour"
echo ----------------------------------------
echo -e "$purple OS name : $nocolour $os"  
echo
echo -e "$purple Hostname : $nocolour $hostname" 
echo
echo -e "$purple Public IP address :$nocolour  $public_ip"
echo
echo -e "$purple private IP address :$nocolour  $ip"
echo
echo -e "$purple System RAM : $nocolour $ram"
echo
echo -e "$purple System storage : $nocolour $storage"
echo
echo -e "$purple used storage : $nocolour $used"
echo
echo -e "$purple available storage : $nocolour $available"