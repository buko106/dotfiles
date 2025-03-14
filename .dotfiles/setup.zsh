INIT_FILE="$HOME/.dotfiles/init_local.zsh"
ALIAS_CMD="alias dotfiles='/usr/bin/git --git-dir=\$HOME/path/to/your/dotfiles.git --work-tree=\$HOME'"

if [ ! -f "$INIT_FILE" ]; then
    echo "$ALIAS_CMD" >> "$INIT_FILE"
    echo "Edit path to dotfile repository in init_local.zsh"
    exit 1
fi

source $INIT_FILE

if [ ! -d "$HOME/.dotfiles" ]; then
    dotfiles checkout
fi
dotfiles config --local status.showUntrackedFiles no

# homebrew
command -v brew>/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap versent/homebrew-taps # for saml2aws
brew install coreutils awscli git saml2aws jq ghq nodenv pyenv

# git
ghq get git@github.com:zsh-git-prompt/zsh-git-prompt.git
git -C $(ghq list -p zsh-git-prompt/zsh-git-prompt) pull

if [ ! -d "$HOME/.local/share/zinit/zinit.git" ]; then
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi