# Aliases

## colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

## lsd
alias ll='lsd -lh --group-dirs=first --icon=never'
alias la='lsd -a --group-dirs=first --icon=never'
alias ls='lsd --group-dirs=first --icon=never'

## bat
alias cat='batcat --style=plain --paging=never'

## nvim
alias vim='nvim'

## cd
alias cdo='cd $OLDPWD'
alias cdw='cd $WORKDIR'
alias cds='cd /home/$NUSER/Scripts'
alias cdd='cd /home/$NUSER/Desktop'

# target
alias target='echo $@ > /home/$NUSER/.target'
