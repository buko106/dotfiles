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
eval "$(nodenv init - --no-rehash)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# direnv
eval "$(direnv hook zsh)"

# FIXME: find modern git status
source "$(ghq list -p zsh-git-prompt/zsh-git-prompt)/zshrc.sh"
PROMPT='%c$(git_super_status)$ '


source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop

source $HOME/.dotfiles/zinit.zsh
source $HOME/.dotfiles/history.zsh
source $HOME/.dotfiles/completion.zsh