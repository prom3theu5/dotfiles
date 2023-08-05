# NVM directory
export NVM_DIR="$HOME/.nvm"

# Editors
export EDITOR=nano
export KUBE_EDITOR=nano

# Path
export PATH="$PATH:/Users/prom3theu5/.dotnet/tools:/Users/prom3theu5/Library/Android/sdk/platform-tools"

# 1Password
export SSH_AUTH_SOCK=~/.1password/agent.sock

# PNPM
export PNPM_HOME="/Users/prom3theu5/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac