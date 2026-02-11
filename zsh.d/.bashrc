# Tools alias
alias ssh="TERM=xterm-256color ssh"
alias cat="bat --paging=never"
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias csv="csvlens" # https://github.com/YS-L/csvlens
alias sql="lazysql" # https://github.com/jorgerojas26/lazysql
alias nvim_prune="rm -rf ~/.local/share/nvim/* && rm -rf ~/.local/state/nvim/* && rm -rf ~/.cache/nvim/*"

# Git alias
alias ga="git add ."
alias gb="git branch"
alias gbc="git branch --show-current"
alias gbd="git branch | grep -v \"^\\*\" | xargs git branch -D"
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

# Environment variables
export EDITOR="nvim" # OpenCode config
export BAT_THEME="gruvbox-dark"

# Tmux
if command -V tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  if [ -n "${TMUX_CUSTOM_CONFIG:-}" ] && [ -f "$TMUX_CUSTOM_CONFIG" ]; then
    exec tmux -f "$TMUX_CUSTOM_CONFIG"
  else
    exec tmux
  fi
fi
