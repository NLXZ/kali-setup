# kali-setup
Automated setup for my Kali Linux environment (tested on clean Kali Linux VMware)

## Installation
1. Download the [latest Kali Linux VM](https://www.kali.org/get-kali/#kali-virtual-machines)
2. Start the VM and switch to tty1 (`Ctrl + Alt + F1`)
3. Log in as `kali:kali` and set a root password:
```shell
sudo passwd root
exit
```
4. Log in as root and run the setup:
```shell
pipx ensurepath && pipx install --global ansible-core
git clone https://github.com/NLXZ/kali-setup /tmp/kali-setup
ansible-playbook /tmp/kali-setup/playbook.yml
```

## Manual configurations
- **Burp Suite extensions:**
  1. Open Burp Suite
  2. Go to `Extensions` > `BApp Store`
  3. Click twice on `Installed` to sort
  4. Reinstall each enabled extension
