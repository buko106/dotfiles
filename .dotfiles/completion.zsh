
zinit light zsh-users/zsh-completions

fpath=($HOME/.dotfiles/completions $fpath)
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

autoload -Uz compinit
compinit