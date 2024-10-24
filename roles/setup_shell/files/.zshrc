# .zshrc

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Globals
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
alias sudo='sudo '
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias ll='lsd -lh --group-dirs=first --icon=never'
alias la='lsd -a --group-dirs=first --icon=never'
alias ls='lsd --group-dirs=first --icon=never'
alias cat='batcat --style=plain --paging=never'
alias vim='nvim'
alias docker-clean='docker rm -f $(docker ps -a -q) &>/dev/null; docker rmi $(docker images -a -q) &>/dev/null; docker network prune -f &>/dev/null; docker volume prune -f &>/dev/null; echo "[!] Docker containers, images, networks, and volumes correctly removed."'
alias cdw='cd $WORKDIR'
alias mkw='kitty --session workspace'
alias target='echo $@ > /home/$NUSER/.target'
alias list-ports='grep -oP '^\d{1,5}(?=/.*open)' "$1" | paste -sd,'
alias stty-size='read r c < <(stty size | awk '\''{print $1, $2}'\'') && echo "stty rows $r columns $c"'
alias alert='sleep $1; beep -r 2'
