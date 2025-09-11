# Kali Setup
I created this ansible playbook to automate the process of setting up my Kali Linux [dotfiles](https://github.com/NLXZ/dotfiles) and configurations.  
Tested on a clean [Kali](https://www.kali.org/get-kali/#kali-virtual-machines) VMware virtual machine.

# Index
- [Setup](#setup)
  - [Change username](#change-username)
  - [Automatic configuration script](#automatic-configuration-script)
- [Manual configurations](#manual-configurations)
  - [Import FoxyProxy configuration](#import-foxyproxy-configuration)
  - [Install BurpSuite extensions](#install-burpsuite-extensions)

# Setup
## Change username
I made this simple [script](https://gist.github.com/NLXZ/2a90f5cb7b066f3571ca52f2cea643fb) to change the username:
```shell
# Press (Ctrl + Alt + F1)
# Login as kali:kali
# Change root password
sudo passwd root
exit
# Log off and relogin as root
# Check it copied correctly and set your new username
bash <(curl -sL https://gist.githubusercontent.com/NLXZ/2a90f5cb7b066f3571ca52f2cea643fb/raw/0865987d1524c5bb5c7cc02eb60385544808fb5e/change-username.sh) kali new_username
# Change your user password
sudo passwd new_username
```

## Automatic configuration script
- Install ansible
```bash
pipx ensurepath && pipx install ansible-core
```

- Clone the repository and run the playbook
```bash
git clone https://github.com/NLXZ/kali-setup.git
cd kali-setup
ansible-playbook -K main.yml
```

# Manual configurations

## Import FoxyProxy configuration
- Open Firefox
- Open FoxyProxy
- Go to `Import > Import from URL`
- Copy this:
```
https://gist.github.com/NLXZ/2372fc1ede2c6c56c5143b888befc64a/raw/829c4502f84d99f54d3627e977ba634e2cdebf21/FoxyProxy.json
```
- Import and save

## Install BurpSuite extensions
- Open BurpSuite
- Go to `Extensions > BApp Store`
- Doble click on `Installed`
- For each ticked extension click on `Reinstall`