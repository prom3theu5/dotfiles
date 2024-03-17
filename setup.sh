#!/bin/bash -e
START_LOCATION="$(pwd)"
ENVIRONMENT_FILES_LOCATION="${START_LOCATION}/environment"

rm -rf ~/.ansible ~/.config ~/.warp ~/.zsh ~/.scripts

sudo dnf -y groups mark install "Development Tools"
sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install procps-ng curl file git zsh util-linux-user

# Change Shell to ZSH
sudo chsh -s "$(which zsh)" "$(whoami)"
touch ~/.zshrc

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Homebrew
CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Restore custom dotfiles
pushd "$ENVIRONMENT_FILES_LOCATION" || exit
cp -R * "${HOME}/"

# Install Homebrew Packages
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew update
brew doctor
brew install python || true
brew bundle --file "$HOME/Brewfile"
rm "$HOME/Brewfile*" || true

echo "Done - Restart Shell Session!"
