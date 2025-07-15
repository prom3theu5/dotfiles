# chezmoi powered dotfiles management.

## Setup
```bash
# Install Homebrew (Skip if installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Github Cli (Skip if installed)
brew install gh

# Login to github (Sets up local git env)
gh auth login

# Install Chezmoi
brew install chezmoi

# Setup Chezmoi
chezmoi init https://github.com/prom3theu5/dotfiles.git

# Bootstrap / Apply
chezmoi cd
./bootstrap.sh
```

## Aliases available after setup is complete
```bash
# Replaces builtins with aliases
cat="bat -pp"
find="fd"
grep="rg --color=auto --line-number"
ls="eza --icons --group-directories-first"
ll="eza --icons --group-directories-first -l"
cd="z"
du="dust"
df="duf"

# Cleanup scripts (bin, obj, ds_store, node_modeules, .artifacts)
cleanup-find="~/.scripts/cleanup.sh find"
cleanup-purge="~/.scripts/cleanup.sh remove"

# Devops aliases
k="kubectl"
h="helm"
t="task"
tf="tofu"
a="ansible"
ap="ansible-playbook"
dc="docker compose"
dclogs="docker compose logs -f --since 1m"

# Chezmoi aliases
cz="chezmoi"
czg="chezmoi git"
czs="chezmoi status"
cza="chezmoi apply"
czc="chezmoi cd"
czd="chezmoi diff"
cze="chezmoi edit"

# git aliases
g="git"
gs="git status"
gl="git log --oneline --graph --decorate"
gco="git checkout"
ga="git add . --all"
gcm="git commit -m"
gac="git add . && git commit -m"
gpl="git pull"
gps="git push"
gpsm="git push --set-upstream origin main"

# macOS shortcut
tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
```