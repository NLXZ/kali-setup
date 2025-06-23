#!/bin/sh

# Python pipx packages
pipx install impacket pywhisker certipy

# DonPAPI
pipx install git+https://github.com/login-securite/DonPAPI.git

# NetExec
pipx install git+https://github.com/Pennyw0rth/NetExec

# Python uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Custom pwnc
wget https://raw.githubusercontent.com/NLXZ/pwnc/refs/heads/main/pwnc.sh -O ~/.local/bin/pwnc
