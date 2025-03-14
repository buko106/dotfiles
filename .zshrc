#
# coreutils
#
alias ls="gls --color"
alias goroot='cd $(git rev-parse --show-toplevel)'

export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
#
# nodenv
#
eval "$(nodenv init -)"

#
# pyenv
#
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#
# rbenv
#
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

#
# for openssl e.g. psycopg2-binary
#
# export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"

#
# direnv
#
export EDITOR=vim
eval "$(direnv hook zsh)"

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
source <(ng completion script)

source $HOME/.docker/init-zsh.sh || true # Added by Docker Desktop
