# Installation

```bash
sudo apt update && sudo apt install ansible -y
git clone https://github.com/NLXZ/dotfiles
cd dotfiles
ansible-playbook main.yml
```

# Change old username

```bash
sh <(curl -sL https://raw.githubusercontent.com/NLXZ/kali-setup/refs/heads/main/change_username.sh) new_username
```

