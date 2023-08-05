# NVM directory
export NVM_DIR="$HOME/.nvm"

# Editors
export EDITOR=nano
export KUBE_EDITOR=nano

# MAC OS SPECIFIC
if [[ "$OSTYPE" == "darwin"* ]]; then
    export SSH_AUTH_SOCK=~/.1password/agent.sock
    export PATH="$PATH:/Users/prom3theu5/.dotnet/tools:/Users/prom3theu5/Library/Android/sdk/platform-tools"
fi

# PNPM
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PNPM_HOME="$HOME/Library/pnpm"
else
    export PNPM_HOME="$HOME/.pnpm"    
fi

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac