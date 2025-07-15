if test -S "$HOME/.1password/agent.sock"
    set -xg SSH_AUTH_SOCK "$HOME/.1password/agent.sock"
end