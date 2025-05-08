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
- Go to `Import > Import Proxy List`
- Copy this:
```
http://127.0.0.1:8080?type=http&color=ff8800&title=BurpSuite
http://127.0.0.1:1080?type=socks5&color=0088ff&title=Socks
```
- Import and save

## Install BurpSuite extensions
- Open BurpSuite
- Go to `Extensions > BApp Store`
- Doble click on `Installed`
- For each ticked extension click on `Reinstall`