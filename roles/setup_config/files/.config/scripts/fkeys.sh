#!/usr/bin/env bash

sleep .2

case $1 in
1)
    bash -c "ip link show tun0 &> /dev/null && echo -n $(ip addr show tun0 | grep 'inet ' | awk '{ print $2 }' | cut -d/ -f1) || echo -n $(hostname -I | awk '{ print $1 }')" | xargs -0 xdotool type --clearmodifiers --delay 0
    ;;
2)
    awk 'NR==1{printf $0; next} {print}' /home/$NUSER/.target 2>/dev/null | xargs -0 xdotool type --clearmodifiers --delay 0
    ;;
3)
    xsel -o > /tmp/clipboard
    ;;
4)
    awk 'NR==1{printf $0; next} {print}' /tmp/clipboard 2>/dev/null | xargs -0 xdotool type --clearmodifiers --delay 0
    ;;
*)
    true
    ;;
esac

