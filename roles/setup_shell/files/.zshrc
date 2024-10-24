# .zshrc

# Globals
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export WORDCHARS=${WORDCHARS//*}
export NUSER=$(getent passwd 1000 | cut -d: -f1)
export WORKDIR="/home/$NUSER/Workdir"
export PATH=/home/$NUSER/bin:/home/$NUSER/.local/bin:/usr/local/bin:/home/$NUSER/.go/bin:$PATH

# Plugins
plugins=(git docker zsh-syntax-highlighting zsh-autosuggestions sudo)
source $ZSH/oh-my-zsh.sh
source /usr/share/doc/fzf/examples/key-bindings.zsh

# Prompt
PROMPT='%{$fg[green]%}%~%{$reset_color%} %(!.#.$) '
DISABLE_AUTO_TITLE="true"
function precmd() {
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

# Alias
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias sudo='sudo '
alias ls='lsd'
alias cat='batcat'
alias vim='nvim'
alias cdw='cd $WORKDIR'
alias mkw='kitty --session workspace'
alias target='echo $@ > /home/$NUSER/.target'
alias list-ports='grep -oP "^\d{1,5}(?=/.*open)" "$1" | paste -sd,'
alias stty-size='stty size | read r c && echo "stty rows $r columns $c"'
alias alert='sleep $1; beep -r 2'

# Functions
function docker-clean () {
    sudo systemctl stop docker.*
    sudo rm -rf /var/lib/docker/*
    echo "[!] Docker cleaned up."
}