#!/bin/bash

alert="\033[1;36m"
success="\033[1;32m"
warning="\033[1;33m"
error="\033[1;31m"
nocolour="\033[00m"

  function privateip() {
     ifconfig | awk '/inet .*broadcast/{print $2}'
  }

  function publicip() {
    curl -s icanhazip.com
  }

  echo -e "$alert private ip address is  $warning $(privateip) $nocolour"
  echo -e "$alert public ip address is $warning $(publicip) $nocolour"


