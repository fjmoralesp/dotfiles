# Zsh History
HISTFILE=/home/francisco/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt histignoredups
setopt sharehistory

# auto completions
fpath=($HOME/.zsh/completions $fpath)
source $HOME/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# auto complete key bindings
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

# Tools alias
alias docker=podman
alias docker-compose="podman-compose"
alias ssh="TERM=xterm-256color ssh"
alias open_vpn="sudo openvpn /home/francisco/client-config.ovpn"
alias cat="bat --paging=never"
alias fzf_preview="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias postman="$HOME/Postman/Postman"

# Git alias
alias ga="git add ."
alias gb="git branch"
alias gbc="git branch --show-current"
alias gc="git commit -m"
alias gch="git checkout"
alias gd="git diff --name-only --relative --diff-filter=d -z | xargs --null bat --diff"
alias gf="git fetch --prune"
alias gpl="git pull origin"
alias gps="git push origin"
alias gs="git status"

# OpenCode alias
alias oc="opencode"

# Agent alias
alias at="$HOME/.config/agents/terminal.sh"

# Environment variables
BAT_THEME="gruvbox-dark"

# Tmux
if command -V tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Starship
eval "$(starship init zsh)"
