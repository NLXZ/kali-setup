# .zshrc

# Globals
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export WORDCHARS=${WORDCHARS//*}
export NUSER=$(getent passwd 1000 | cut -d: -f1)
export WORKDIR="/home/$NUSER/Workdir"
export PATH=/home/$NUSER/.local/bin:$PATH

# Plugins
DISABLE_MAGIC_FUNCTIONS=true
plugins=(git docker zsh-syntax-highlighting zsh-autosuggestions sudo)
source $ZSH/oh-my-zsh.sh
source /usr/share/doc/fzf/examples/key-bindings.zsh

# Prompt
PROMPT='%{$fg[blue]%}%~%{$reset_color%} %(!.#.$) '
DISABLE_AUTO_TITLE="true"
function precmd() {
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

# Suggest-Paste Fix
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)

# Alias
unalias gau
unalias gf
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ffuf='ffuf -c'
alias wfuzz='wfuzz -c'
alias sudo='sudo '
alias ls='lsd'
alias cat='batcat'
alias vi='nvim'
alias py='python3'
alias docker='sudo docker'
alias cdw='cd $WORKDIR'
alias target='echo "$@" > /home/$NUSER/.target'
alias IP=$'ip link show tun0 &>/dev/null && ip addr show tun0 | grep \'inet \' | awk \'{ print $2 }\' | cut -d/ -f1|| hostname -I | awk \'{ print $1 }\''
alias stty-size='echo -e "stty rows $(tput lines) columns $(tput cols)\nexport TERM=xterm\nexport SHELL=/bin/bash"'
alias vpn='sudo openvpn'
alias p='proxychains -q'
alias c='xsel -bi'

# Functions
http() {
    local port=${1:-80}
    /usr/bin/python3 -m http.server "$port"
}

smb() {
    local sharename="shared"
    local path="."
    local additional_args=()
    local auth_args=()

    while [ $# -gt 0 ]; do
        case "$1" in
            -u)
                user="$2"
                auth_args+=("-username" "$user")
                shift 2
                ;;
            -p)
                password="$2"
                auth_args+=("-password" "$password")
                shift 2
                ;;
            *)
                if [ "$sharename" = "shared" ]; then
                    sharename="$1"
                elif [ "$path" = "." ]; then
                    path="$1"
                else
                    additional_args+=("$1")
                fi
                shift
                ;;
        esac
    done

    smbserver.py -smb2support "$sharename" "$path" "${auth_args[@]}" "${additional_args[@]}"
}

docker-clean() {
    docker system prune --all --volumes
}

bloodhound() {
    if [ "$1" = "start" ]; then
        sudo /opt/bloodhound/bloodhound-cli containers up
        port=$(grep -oP 'BLOODHOUND_PORT=\K\d+' /opt/bloodhound/.env)
        echo "[*] Running on: http://127.0.0.1:$port"
    elif [ "$1" = "stop" ]; then
        sudo /opt/bloodhound/bloodhound-cli containers down
    elif [ "$1" = "status" ]; then
        sudo /opt/bloodhound/bloodhound-cli running
    else
        echo '[!] Error. Usage: bloodhound start | stop | status'
    fi
}

s() {
    if [ $# -lt 2 ]; then
        echo '[!] Usage: s [options] <user>@<host> <password>'
        return 1
    fi

    args=("$@")
    password="${args[-1]}"
    unset 'args[-1]'

    sshpass -p "$password" ssh -o StrictHostKeyChecking=no \
                              -o GlobalKnownHostsFile=/dev/null \
                              -o UserKnownHostsFile=/dev/null \
                              "${args[@]}"
}
