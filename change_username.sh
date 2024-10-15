#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: You must specify a username."
    echo "Usage: change_username.sh <new_username>"
    exit 1
fi

if [ "$EUID" -ne 0 ]; then
    echo "Error: You must run as root."
    exit 1
fi

new_user="$1"
old_user="$(getent passwd 1000 | cut -d: -f1)"

if [ "$old_user" == "$(logname)" ]; then
    echo "Error: You must login as root."
    exit 1
fi

# Change old username
killall -u $old_user
usermod -l $new_user $old_user
usermod -d /home/$new_user -m $new_user
groupmod -n $new_user $old_user

# Optional
echo "NUSER=$new_user" >> /etc/environment
timedatectl set-timezone Europe/Madrid
timedatectl set-ntp true
