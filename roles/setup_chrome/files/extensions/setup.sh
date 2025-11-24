#!/bin/bash

# Start Google Chrome in background
Xvfb :99 -screen 0 1920x1080x24 &
timeout 1 sh -c 'DISPLAY=:99 google-chrome --no-sandbox --disable-gpu'
DISPLAY=:99 google-chrome --no-sandbox --disable-gpu &

# Wait for the extentensions to be installed
extensions=$(jq -r 'keys[]' /tmp/extensions/extensions.json | xargs)
for extension in $(echo $extensions); do
    while [ ! -d "$HOME/.config/google-chrome/Default/Extensions/$extension" ]; do
        sleep 1
    done
done

# Ensure all extension config directories
for extension in $(echo $extensions); do
    url=$(find "$HOME/.config/google-chrome/Default/Extensions/$extension" -name 'options.html' | grep -oP "$extension/.*?/\K.*")
    echo "chrome-extension://$extension/$url"
    while [ ! -d "$HOME/.config/google-chrome/Default/Local Extension Settings/$extension" ]; do
        sleep 1
    done
done
pkill chrome || true

# Configure extensions
cd /tmp/extensions
npm install level
node config.js extensions.json
