[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
[[ -f ~/.zsh/nvm.zsh ]] && source ~/.zsh/nvm.zsh
[[ -f ~/.zsh/bun.zsh ]] && source ~/.zsh/bun.zsh
[[ -f ~/.zsh/variables.zsh ]] && source ~/.zsh/variables.zsh

# Load Starship
eval "$(starship init zsh)"

# Load Direnv
eval "$(direnv hook zsh)"