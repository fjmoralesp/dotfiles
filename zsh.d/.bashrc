# Tools alias
alias ssh="TERM=xterm-256color ssh"
alias cat="bat --paging=never"
alias postman="$HOME/Postman/Postman"
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# Git alias
alias ga="git add ."
alias gb="git branch"
alias gbc="git branch --show-current"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gch="git checkout"
alias gd="git diff --name-only --relative --diff-filter=d -z | xargs --null bat --diff"
alias gf="git fetch --prune"
alias gl="git log"
alias gm="git merge"
alias gpl="git pull origin"
alias gps="git push origin"
alias gs="git status"

# OpenCode alias
alias oc="opencode"

# Agent alias
alias at="$HOME/.config/agents/terminal.sh"

# Environment variables
EDITOR="nvim" # OpenCode config
BAT_THEME="gruvbox-dark"

# Tmux
if command -V tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
