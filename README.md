# Kali Setup
I created this ansible playbook to automate the process of setting up my Kali Linux ![dotfiles](https://github.com/NLXZ/dotfiles) and configurations.

# Index
- [Setup](#setup)
- [Manual configurations](#manual-configurations)
  - [Import FoxyProxy configuration](#import-foxyproxy-configuration)
  - [Install BurpSuite extensions](#install-burpSuite-extensions)
  - [Setup Neo4j and BloodHound](#setup-neo4j-and-bloodHound)
  - [Change username](#change-username)

# Setup
- Install Ansible
```bash
sudo apt update
sudo apt install pipx -y
pipx ensurepath
pipx install ansible-core
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

## Setup Neo4j and BloodHound
- Start Neo4j console:
```shell
sudo -v && sudo neo4j console & sleep 3 && xdg-open http://localhost:7474/ && bloodhound && kill
```
- Open ![http://localhost:7474/](http://localhost:7474/) on Firefox
- Login as `neo4j:neo4j` and set new password
- Close Firefox
- Go to BloodHound and login `neo4j:new_passwd`
- Enable `Settings > Dark Mode`
- Close BloodHound

## Change username
I made this simple ![script](https://gist.github.com/NLXZ/2a90f5cb7b066f3571ca52f2cea643fb) to change the username
- Press `Ctrl + Alt + F1`
- Login as kali
- Change root password
- Log off and relogin as root
- Run this:
```shell
# Check it copied correctly and set your new username
bash <(curl -sL https://gist.githubusercontent.com/NLXZ/2a90f5cb7b066f3571ca52f2cea643fb/raw/b911bb2f77a490819980903361ebc2c37c204298/change_username.sh) kali new_username
```
- Change user password