# Kali Setup
I created this ansible playbook to automate the process of setting up my Kali Linux [dotfiles](https://github.com/NLXZ/dotfiles) and configurations.  
Tested on a clean [Kali](https://www.kali.org/get-kali/#kali-virtual-machines) VMware virtual machine.

## 1. Setup
I made this simple [script](https://gist.github.com/NLXZ/2a90f5cb7b066f3571ca52f2cea643fb) to change the username:
> Start the VM and press `Ctrl + Alt + F1`
- Login as `kali:kali` and change root password:
```shell
sudo passwd root
exit
```
- Login as root:
```shell
git clone https://github.com/NLXZ/kali-setup /tmp/kali-setup
cd /tmp/kali-setup
NEW_USER='user' NEW_PASS='pass' sh setup.sh
```

## 2. Import FoxyProxy configuration
- Open Chrome
- Open FoxyProxy Options `Import`
- Import `Home` > `.dotfiles` > `_misc` > `FoxyProxy.json`
- Save

## 3. Install BurpSuite extensions
- Open BurpSuite
- Go to `Extensions > BApp Store`
- Doble click on `Installed`
- For each ticked extension click on `Reinstall`