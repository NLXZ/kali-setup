#!/bin/sh

# Impacket
pipx install impacket

# Python uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# DonPAPI
pipx install git+https://github.com/login-securite/DonPAPI.git
