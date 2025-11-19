#!/bin/sh

if [ -z "$NEW_USER" ] || [ -z "$NEW_PASS" ]; then
    echo "Error: Environment variables NEW_USER and NEW_PASS are required."
    echo "Usage:"
    echo "  NEW_USER=nlxz NEW_PASS=nlxz123 OLD_USER=kali ./setup.sh"
    exit 1
fi

OLD_USER="${OLD_USER:-$(id -un 1000)}"

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: Must run as root."
    exit 1
fi

if [ "$OLD_USER" = "$(logname 2>/dev/null)" ]; then
    echo "Error: Cannot run while logged in as '$OLD_USER'."
    exit 1
fi

if ! id "$OLD_USER" >/dev/null 2>&1; then
    echo "Error: User '$OLD_USER' not found."
    exit 1
fi

killall -u "$OLD_USER" 2>&1 > /dev/null
usermod -l "$NEW_USER" -d "/home/$NEW_USER" -m "$OLD_USER" 2>&1 > /dev/null
groupmod -n "$NEW_USER" "$OLD_USER" 2>&1 > /dev/null
echo "$NEW_USER:$NEW_PASS" | chpasswd 2>&1 > /dev/null

su - "$NEW_USER" sh -c "pipx ensurepath && pipx install ansible-core"
su - "$NEW_USER" sh -c "ansible-playbook $PWD/main.yml --extra-vars 'ansible_become_pass=$NEW_PASS'"
