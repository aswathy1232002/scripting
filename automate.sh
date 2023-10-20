#!/bin/bash

warning="\033[1;33m"
purple="\033[0;35m"
nocolour="\033[00m"
cyan="\033[0;36m"
success="\033[1;32m"
alert="\033[1;36m"

if [[ $EUID -eq 0 ]]; then
    echo -e "$warning Do You Want to Install Brave and AnyDesk? (Yes/No) $nocolour"
    read answer
    if [[ $answer -eq Yes ]]; then
    echo "checking on system"

      if [[ -f /usr/bin/brave-browser ]]; then
        if [[ -f /usr/bin/anydesk ]];then
        echo -e $alert Brave already installed $nocolour

         elif [[ ! -f /usr/bin/brave-browser ]]; then
        echo -e "$cyan Installing Brave $nocolour"
        echo
        echo "wait for some time....."
        apt -qq install curl &> /dev/null

        curl -fsSLoqq /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg &> /dev/null

        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list &> /dev/null

        apt -qq update &> /dev/null

        apt -qq install brave-browser -y &> /dev/null

        echo -e "$success Installation of Brave success $nocolour"
        echo

    if [[ -f /usr/bin/anydesk ]];then
    echo -e $alert File Already Exist $nocolour
    elif [[ ! -f /usr/bin/anydesk ]];then
        echo -e "$cyan Installing AnyDesk $nocolour"
        echo
        echo "wait for some time....."

        wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add - &> /dev/null

        echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list

        apt -qq update &> /dev/null

        apt -qq install anydesk -y &> /dev/null

        echo -e "$success Installation of AnyDesk success $nocolour"
    else
        echo "Run in sudo mode !!"
    fi
fi
fi
fi
fi
fi

