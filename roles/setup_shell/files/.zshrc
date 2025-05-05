# .zshrc

# Globals
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export WORDCHARS=${WORDCHARS//*}
export NUSER=$(getent passwd 1000 | cut -d: -f1)
export WORKDIR="/home/$NUSER/Workdir"
export PATH=$PATH:/home/$NUSER/.local/bin:/home/$NUSER/.go/bin

# Plugins
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
alias sudo='sudo '
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ffuf='ffuf -c'
alias wfuzz='wfuzz -c'
alias ls='lsd'
alias cat='batcat'
alias vim='nvim'
alias cdw='mkdir -p ~/Workdir && cd $WORKDIR'
alias target='echo "$@" > /home/$NUSER/.target'
alias stty-size='echo "stty rows $(tput lines) columns $(tput cols)"'
alias sliver='nohup sliver-server daemon &>/dev/null & disown; sliver-client'


# Functions
function list-ports () {
    grep -hoP "^\d{1,5}(?=/.*open)" $@ | paste -sd,
}

function docker-clean () {
    sudo docker rm -f $(sudo docker container ls -qa)
    sudo docker rmi -f $(sudo docker images -qa)
    echo "[+] Docker cleaned up."
}

function mkw {
    if [ -z "$1" ]; then echo "[!] Need a name of session."; return 1; fi
    mkdir -p $WORKDIR/{enum,tools,findings,shared}
    tmux new-session -d -s $1
    tmux rename-window -t $1:1 "VPN"
    tmux send-keys -t $1:1 "cd $WORKDIR/ && clear" C-m
    tmux new-window -t $1:2 -n "Term"
    tmux send-keys -t $1:2 "cd $WORKDIR/enum && clear" C-m
    tmux select-window -t $1:1
    tmux attach -t $1
}

function bloodhound {
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
