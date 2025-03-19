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

brew install coreutils git saml2aws jq ghq nodenv pyenv direnv
