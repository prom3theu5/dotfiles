# Replaces builtins with aliases
alias cat="bat -pp"
alias find="fd"
alias grep="rg --color=auto --line-number"
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias cd="z"
alias du="dust"
alias df="duf"

# Vpn
alias vpn="~/.scripts/vpn.sh"

# Cleanup scripts (bin, obj, ds_store, node_modeules, etc)
alias cleanup-find="~/.scripts/cleanup.sh find"
alias cleanup-purge="~/.scripts/cleanup.sh remove"

# Devops aliases
alias k="kubectl"
alias h="helm"
alias t="task"
alias tf="tofu"
alias a="ansible"
alias ap="ansible-playbook"
alias dc="docker compose"
alias dclogs="docker compose logs -f --since 1m"

# Chezmoi aliases
alias cz="chezmoi"
alias czg="chezmoi git"
alias czs="chezmoi status"
alias cza="chezmoi apply"
alias czc="chezmoi cd"
alias czd="chezmoi diff"
alias cze="chezmoi edit"

# git aliases
alias g="git"
alias gs="git status"
alias gl="git log --oneline --graph --decorate"
alias gco="git checkout"
alias ga="git add . --all"
alias gcm="git commit -m"
alias gac="git add . && git commit -m"
alias gpl="git pull"
alias gps="git push"
alias gpsm="git push --set-upstream origin main"

# macOS shortcut
if test -d /Applications/Tailscale.app
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
end
