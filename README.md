# Kali Setup
I created this ansible playbook to automate the process of setting up my Kali Linux [dotfiles](https://github.com/NLXZ/dotfiles) and configurations.
Works on new clean [kali vmware machine](https://www.kali.org/get-kali/#kali-virtual-machines)

# Index
- [Setup](#setup)
  - [Change username](#change-username)
  - [Automatic configuration script](#automatic-configuration-script)
- [Manual configurations](#manual-configurations)
  - [Import FoxyProxy configuration](#import-foxyproxy-configuration)
  - [Install BurpSuite extensions](#install-burpSuite-extensions)
  - [Setup Neo4j and BloodHound](#setup-neo4j-and-bloodHound)

# Setup
## Change username
I made this simple [script](https://gist.github.com/NLXZ/2a90f5cb7b066f3571ca52f2cea643fb) to change the username
- Press `Ctrl + Alt + F1`
- Login as kali
- Change root password
- Log off and relogin as root
- Run this:
```shell
# Check it copied correctly and set your new username
bash <(curl -sL https://gist.githubusercontent.com/NLXZ/2a90f5cb7b066f3571ca52f2cea643fb/raw/0865987d1524c5bb5c7cc02eb60385544808fb5e/change-username.sh) kali new_username
```
- Change user password

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

## Setup BloodHound
- Download BloodHound
```shell
sudo mkdir -p /opt/bloodhound
wget https://github.com/SpecterOps/bloodhound-cli/releases/latest/download/bloodhound-cli-linux-amd64.tar.gz
sudo tar -xvzf bloodhound-cli-linux-amd64.tar.gz -C /opt/bloodhound
rm -f bloodhound-cli-linux-amd64.tar.gz
cd /opt/bloodhound
```
- Change password and port
```shell
sudo ./bloodhound-cli config set default_admin.password 'password'
echo "BLOODHOUND_PORT=8888" | sudo tee .env
```
- Build
```shell
sudo ./bloodhound-cli install
```
- Usage  
>I configured a function on my .zshrc to start and stop the service just by running:  
`bloodhound start | stop | status`
```shell
function bloodhound {
    if [ "$1" = "start" ]; then
        sudo /opt/bloodhound/bloodhound-cli containers up
        port=$(grep -oP 'BLOODHOUND_PORT=\K\d+' /opt/bloodhound/.env)
        echo "[*] Running on: http://127.0.0.1:$port"
    elif [ "$1" = "stop" ]; then
        sudo /opt/bloodhound/bloodhound-cli containers down
    elif [ "$1" = "status" ]; then
        sudo /opt/bloodhound/bloodhound-cli running
    else
        echo '[!] Error. Usage: bloodhound start | stop | status'
    fi
}
```