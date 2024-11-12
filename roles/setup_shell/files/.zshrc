# .zshrc

# Globals
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export WORDCHARS=${WORDCHARS//*}
export NUSER=$(getent passwd 1000 | cut -d: -f1)
export WORKDIR="/home/$NUSER/Workdir"
export PATH=$PATH:/home/$NUSER/.go/bin

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

# Alias
alias sudo='sudo '
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ls='lsd'
alias cat='batcat'
alias vim='nvim'
alias cdw='cd $WORKDIR'
alias mkw='kitty --session workspace --detach'
alias target='echo "$@" > /home/$NUSER/.target'
alias stty-size='echo "stty rows $(tput lines) columns $(tput cols)"'
alias sliver='nohup sliver-server daemon &>/dev/null & disown; sliver-client'

# Functions
function list-ports () {
    grep -hoP "^\d{1,5}(?=/.*open)" $@ | paste -sd,
}

function docker-clean () {
    sudo systemctl stop docker.*
    sudo rm -rf /var/lib/docker/*
    echo "[!] Docker cleaned up."
}
