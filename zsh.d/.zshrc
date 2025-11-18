# Zsh History
HISTFILE=$HOME/.zsh_history
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

# Import bashrc
source $HOME/.config/zsh.d/.bashrc

# Starship
eval "$(starship init zsh)"
