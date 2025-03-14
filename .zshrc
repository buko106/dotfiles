INIT_FILE="$HOME/.dotfiles/init_local.zsh"
if [ -f "$INIT_FILE" ]; then
    source $INIT_FILE
else
    echo "$INIT_FILE is not found. Setup dotfiles."
fi

# coreutils
alias ls="gls --color"

# vscode
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# nodenv
eval "$(nodenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# direnv
eval "$(direnv hook zsh)"

# FIXME: find modern git status
source "$(ghq list -p zsh-git-prompt/zsh-git-prompt)/zshrc.sh"
PROMPT='%c$(git_super_status)$ '

#
# zshで適度なcase-insensitive補完
# https://qiita.com/watertight/items/2454f3e9e43ef647eb6b の３番目
#
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# brew install zsh-completion
#
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Load Angular CLI autocompletion.
command -v ng>/dev/null && source <(ng completion script)

source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop
