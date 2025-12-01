# Kali Setup
I created this ansible playbook to automate the process of setting up my Kali Linux [dotfiles](https://github.com/NLXZ/dotfiles) and configurations.  
Tested on a clean [Kali](https://www.kali.org/get-kali/#kali-virtual-machines) VMware virtual machine.

## 1. Setup
> Start the VM and press `Ctrl + Alt + F1`
- Login as `kali:kali` and change root password:
```shell
sudo passwd root
exit
```
- Login as root:
```shell
pipx ensurepath && pipx install --global ansible-core
git clone https://github.com/NLXZ/kali-setup /tmp/kali-setup
ansible-playbook /tmp/kali-setup/playbook.yml
```

## 2. Import FoxyProxy configuration
- Open Chrome
- Open FoxyProxy Options `Import`
- Import `/usr/share/chrome/FoxyProxy.json`
- Save

## 3. Install BurpSuite extensions
- Open BurpSuite
- Go to `Extensions > BApp Store`
- Doble click on `Installed`
- For each ticked extension click on `Reinstall`