# .zshrc

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Globals
export EDITOR=nvim
export VISUAL=nvim
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
function precmd() {
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}

# Aliases
source $ZSH/custom/aliases.sh

# Functions
source $ZSH/custom/functions.sh
