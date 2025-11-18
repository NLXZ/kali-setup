#!/bin/bash

# custom
wget https://raw.githubusercontent.com/NLXZ/pwnc/refs/heads/main/pwnc.sh -O ~/.local/bin/pwnc

# pipx packages
packages=(
    "impacket"
    "pywhisker"
    "certipy"
    "uro"
    "clairvoyance"
    "'evil-winrm-py[kerberos]'"
    "uv"
    "git+https://github.com/login-securite/DonPAPI.git"
    "git+https://github.com/Pennyw0rth/NetExec"
)

for package in "${packages[@]}"; do
    pipx install "$package"
done

# go packages
go env -w GOBIN="$HOME/.local/bin"

urls=(
    "github.com/0xpugal/dedupe@latest"
    "github.com/tomnomnom/unfurl@latest"
    "github.com/tomnomnom/assetfinder@latest"
    "github.com/tomnomnom/qsreplace@latest"
    "github.com/tomnomnom/gf@latest"
    "github.com/lc/gau/v2/cmd/gau@latest"
    "github.com/haccer/subjack@latest"
    "github.com/PentestPad/subzy@latest"
    "github.com/hahwul/dalfox/v2@latest"
    "github.com/Hackmanit/Web-Cache-Vulnerability-Scanner@latest"
    "github.com/devploit/nomore403@latest"
    "github.com/nlxz/nscope@main"
    "github.com/nlxz/hacks/kxss@latest"
    "github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest"
    "github.com/projectdiscovery/pdtm/cmd/pdtm@latest"
    "github.com/bitquark/shortscan/cmd/shortscan@latest"
)

for url in "${urls[@]}"; do
    go install "$url"
done

# gf patterns
git clone https://github.com/NLXZ/gf-patterns ~/.gf/

# wcvs
mv ~/.local/bin/Web-Cache-Vulnerability-Scanner ~/.local/bin/wcvs

# project discovery tools
pdtm -bp ~/.local/bin -ia

# docker compose
mkdir -p ~/.docker/cli-plugins
cp /usr/bin/docker-compose ~/.docker/cli-plugins/

# bloodhound
wget https://github.com/SpecterOps/bloodhound-cli/releases/latest/download/bloodhound-cli-linux-amd64.tar.gz
tar -xvzf bloodhound-cli-linux-amd64.tar.gz -C ~/.local/bin/
rm -f bloodhound-cli-linux-amd64.tar.gz

# git
mkdir -p ~/tools/

git clone https://github.com/urbanadventurer/username-anarchy ~/tools/username-anarchy
ln -s ~/tools/username-anarchy/username-anarchy ~/.local/bin/username-anarchy

git clone https://github.com/s0md3v/Corsy ~/tools/Corsy
chmod +x ~/tools/Corsy/corsy.py
ln -s ~/tools/Corsy/corsy.py ~/.local/bin/corsy.py

git clone https://github.com/defparam/smuggler ~/tools/smuggler
ln -s ~/tools/smuggler/smuggler.py ~/.local/bin/smuggler.py
