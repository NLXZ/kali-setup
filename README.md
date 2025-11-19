# Kali Setup
I created this ansible playbook to automate the process of setting up my Kali Linux [dotfiles](https://github.com/NLXZ/dotfiles) and configurations.  
Tested on a clean [Kali](https://www.kali.org/get-kali/#kali-virtual-machines) VMware virtual machine.

# Index
1. [Setup](#setup)
  1.1. [Change username](#change-username)
  1.2. [Automatic configuration script](#automatic-configuration-script)
2. [Manual configurations](#manual-configurations)
  2.2. [Import FoxyProxy configuration](#import-foxyproxy-configuration)
  2.3. [Install BurpSuite extensions](#install-burpsuite-extensions)

# 1. Setup
## Change username
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
NEW_USER='' NEW_PASS='' ./setup.sh
```

# 2. Manual configurations

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