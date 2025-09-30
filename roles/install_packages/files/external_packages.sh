#!/bin/sh

# Python pipx packages
pipx install impacket pywhisker certipy uro 

pipx install git+https://github.com/login-securite/DonPAPI.git

pipx install git+https://github.com/Pennyw0rth/NetExec

# Python uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Custom pwnc
wget https://raw.githubusercontent.com/NLXZ/pwnc/refs/heads/main/pwnc.sh -O ~/.local/bin/pwnc

# Go packages
go env -w GOBIN=/home/$USER/.local/bin

go install github.com/0xpugal/dedupe@latest
go install github.com/tomnomnom/unfurl@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/tomnomnom/qsreplace@latest
go install github.com/tomnomnom/gf@latest && mkdir -p ~/.gf && git clone https://github.com/NLXZ/gf-patterns && mv gf-patterns/*.json ~/.gf/ && rm -rf gf-patterns
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/haccer/subjack@latest
go install github.com/PentestPad/subzy@latest
go install github.com/hahwul/dalfox/v2@latest
go install github.com/Hackmanit/Web-Cache-Vulnerability-Scanner@latest && mv ~/.local/bin/Web-Cache-Vulnerability-Scanner ~/.local/bin/wcvs
go install github.com/devploit/nomore403@latest
go install github.com/glebarez/cero@latest
go install github.com/nlxz/nscope@main
go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
go install github.com/projectdiscovery/pdtm/cmd/pdtm@latest && pdtm -bp ~/.local/bin -ia

# Git
mkdir -p ~/git/

git clone https://github.com/urbanadventurer/username-anarchy ~/git/username-anarchy
ln -s ~/git/username-anarchy/username-anarchy ~/.local/bin/username-anarchy

git clone https://github.com/s0md3v/Corsy ~/git/Corsy
chmod +x ~/git/Corsy/corsy.py
ln -s ~/git/Corsy/corsy.py ~/.local/bin/corsy.py

git clone https://github.com/defparam/smuggler ~/git/smuggler
ln -s ~/git/smuggler/smuggler.py ~/.local/bin/smuggler.py
