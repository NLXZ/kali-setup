# Functions

function docker-clean () {
  echo "[*] Cleaning Docker..."

  docker rm -f $(docker ps -a -q) &>/dev/null
  docker rmi $(docker images -a -q) &>/dev/null
  docker network prune -f  &>/dev/null
  docker volume prune -f &>/dev/null

  echo "[!] Docker containers, images and networks correctly removed."
}

function alert () {
  sleep $1 && timeout 0.5 speaker-test -t sine &> /dev/null
}


function stty-size () {
  read r c < <(stty size | awk '{print $1, $2}')
  echo "stty rows $r columns $c"
}

function list-ports () {
  if [[ -z "$1" ]]; then
    echo "Usage: $0 <file>"
    return 1
  elif [[ ! -r "$1" ]]; then
    echo "Error: Cannot read the file '$1'"
    return 1
  fi

  ports=$(grep -oP '^\d{1,5}(?=/)' "$1" | paste -sd,)

  if [[ -z "$ports" ]]; then
    echo "No ports found"
    return 1
  fi

  echo "$ports"
}

function tmuxx () {
  mkdir -p $HOME/Desktop/vpn
  mkdir -p $WORKDIR/{scan,info,exploits}
  tmux new-session -d -s $(logname)
  tmux rename-window -t $(logname):1 "VPN"
  tmux send-keys -t $(logname):1 "cd /home/$NUSER/Desktop/vpn && clear" C-m
  tmux new-window -t $(logname):2 -n "Scan"
  tmux send-keys -t $(logname):2 "cd $WORKDIR/scan && clear" C-m
  tmux new-window -t $(logname):3 -n "Term"
  tmux send-keys -t $(logname):3 "cd $WORKDIR && clear" C-m
  tmux select-window -t $(logname):1
  tmux attach -t $(logname)
}
