#!/bin/bash

warning="\033[1;33m"
purple="\033[0;35m"
nocolour="\033[00m"
cyan="\033[0;36m"
success="\033[1;32m"
alert="\033[1;36m"

if [[ $EUID -eq 0 ]]; then
    read -p " Do You Want to Install Brave, RustDesk, and VirtualBox? (Y/y): " answer

    if [[ $answer =~ ^[Yy]$ ]]; then
        echo "Checking the system"

        if command -v brave-browser; then
            echo -e "$alert Brave is already installed $nocolour"
        else
            echo -e "$cyan Installing Brave $nocolour"
            echo "Please wait..."

            apt  update
            apt install  curl  &> /dev/null
            curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg &> /dev/null
            echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list &> /dev/null
            apt  update &> /dev/null
            apt  install -y brave-browser
            echo -e "$success Installation of Brave successful$nocolour"
        fi

        if command -v RustDesk ; then
            echo -e "$alert RustDesk is already installed$nocolour"
        else
            echo -e "$cyan Installing RustDesk$nocolour"
            echo "Please wait..."
            wget rustdesk-1.1.9.deb https://github.com/rustdesk/rustdesk/releases/download/1.1.9/rustdesk-1.1.9.deb &> /dev/null
            apt  update &> /dev/null
            apt  install -y ./rustdesk-1.1.9.deb 
            echo -e "$success Installation of RustDesk successful$nocolour"
        fi
    
        if command -v virtualbox ; then
            echo -e "$alert VirtualBox is already installed $nocolour"
        else
            echo -e "$cyan Installing VirtualBox$nocolour"
            echo "Please wait..."
            apt  install -y virtualbox
            echo -e "$success Installation of VirtualBox successful $nocolour"
        fi
    fi

    usernames=("software-7am" "software-9am" "software-11am" "software-2pm" "software-4pm" "administrator")
    passwords=("sw@7" "sw@9" "sw@11" "sw@2" "sw@4" "admin")

    for ((i=0; i<${#usernames[@]}; i++)); do
        username="${usernames[i]}"
        password="${passwords[i]}"

        if id "$username" &>/dev/null; then
            echo -e "${alert}User $username already exists.${nocolour}" 
        else
            useradd -m "$username"
            echo "$username:$password" | chpasswd
            echo "${success}User $username added successfully${nocolour}"
        fi
    done

    usermod -aG sudo administrator

else
    echo "Run the script with sudo privileges"
fi
