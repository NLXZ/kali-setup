# Set up

- Install Ansible
```bash
sudo apt update && sudo apt install ansible -y
```

- Clone the repository and run the playbook
```bash
git clone https://github.com/NLXZ/dotfiles.git
cd dotfiles
ansible-playbook -K main.yml
```

# Change old username

- This script is useful for pre-built VM Kali machines
> Must to be run as root
```bash
sh <(curl -sL https://raw.githubusercontent.com/NLXZ/kali-setup/refs/heads/main/change_username.sh) new_username
```

